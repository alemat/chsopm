class Project < ApplicationRecord
  belongs_to :institution
  belongs_to :focus_area
  belongs_to :sub_focus_area
  belongs_to :funding_status
  belongs_to :reporting_type
  has_many :funders, dependent: :destroy
  has_many :implementation_areas, dependent: :destroy
  has_many :evaluations, dependent: :destroy
  has_many :performance_reports

  accepts_nested_attributes_for :funders, allow_destroy: true
  accepts_nested_attributes_for :implementation_areas, allow_destroy: true

  validates :project_title, :start_date, :end_date, presence: true
  validate :end_date_must_be_after_start_date

  scope :list_by_focus_area, -> (focus_area) { where(focus_area_id: focus_area) }
  scope :list_by_sub_focus_area, -> (sub_focus_area) { where(sub_focus_area_id: sub_focus_area) }
  scope :list_by_region, -> (region) { joins(:implementation_areas).where('implementation_areas.region_id = ?', region).uniq }
  PHASE_STATUSES = [PHASEDOUT='Phased Out', ACTIVE='Active', AMENDED='Amended']
  def self.search(focus_area, sub_focus_area, region)
    projects = []
    available_filters = {focus_area => list_by_focus_area(focus_area), 
      sub_focus_area => list_by_sub_focus_area(sub_focus_area), 
      region => list_by_region(region)}.select{|k,v| !k.blank?}
    counter = 0
    available_filters.each do |k,v|
      projects = counter == 0 ? v : projects.merge(v)
      counter += 1
    end
    return projects.uniq
  end

  def end_date_must_be_after_start_date
    if end_date < start_date
      errors.add(:end_date, 'must be after start date')
    end
  end

  def mid_term_evaluation_date
    difference_days = (end_date - start_date).to_i
    return start_date + (difference_days/2)
  end

  def end_term_evaluation_date
    return end_date - 10
  end

  def mid_term_sixty_evaluation_date
    return mid_term_evaluation_date - 180

  end

  def self.upcoming_mid_term_evaluations
    return Project.all.select{|p| Date.today >= p.mid_term_sixty_evaluation_date and Date.today <= p.mid_term_evaluation_date and p.mid_term_evaluation.blank? }
  end

  def self.upcoming_end_term_evaluations
    return Project.all.select{|p| Date.today >= p.end_term_evaluation_date and Date.today <=  p.end_date and p.end_term_evaluation.blank? }
  end

  def self.missed_mid_term_evaluations
    Project.all.select{|p| p.mid_term_evaluation_date < Date.today and p.mid_term_evaluation.blank? }
  end

  def self.missed_end_term_evaluations
    Project.all.select{|p| p.end_term_evaluation_date < Date.today and p.end_term_evaluation.blank? }
  end

  def mid_term_evaluation
    evaluations.where('project_evaluation_type = ?', Evaluation::MID_TERM)
  end

  def end_term_evaluation
    evaluations.where('project_evaluation_type = ?', Evaluation::END_TERM)
  end

  def status
    Date.today < start_date ? 'Not Started' : ((Date.today > start_date and Date.today < end_date) ? 'Ongoing' : (Date.today > end_date ? 'Deadline Passed' : '') )
  end

  def to_s
    project_title
  end
  
end
