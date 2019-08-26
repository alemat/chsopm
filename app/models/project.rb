class Project < ApplicationRecord
  belongs_to :institution
  belongs_to :focus_area
  belongs_to :sub_focus_area
  belongs_to :funding_status
  belongs_to :reporting_type
  belongs_to :user
  has_many :funders, dependent: :destroy
  has_many :implementation_areas, dependent: :destroy
  has_many :evaluations, dependent: :destroy
  has_many :performance_reports
  has_many :project_amendments
  has_one_attached :proposal

  accepts_nested_attributes_for :funders, allow_destroy: true
  accepts_nested_attributes_for :implementation_areas, allow_destroy: true

  validates :project_title, :start_date, :end_date, :total_budget, :program_budget, :admin_budget, :currency, :funding_status, :direct_beneficiaries, :indirect_beneficiaries, :project_focal_person, :phone_number, :email, presence: true
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

  def pa_status
    acceptance_status.blank? ? 'Pending' : 'Accepted'
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
    return end_date - 180
  end

  def mid_term_sixty_evaluation_date
    return mid_term_evaluation_date - 180

  end

  def self.upcoming_mid_term_evaluations(user)
    if user.admin?
      return Project.all.select{|p| Date.today >= p.mid_term_sixty_evaluation_date and Date.today <= p.mid_term_evaluation_date and p.mid_term_evaluation.blank? and !p.acceptance_status.blank? }
    else
      return Project.where("user_id = ?", user.id).select{|p| Date.today >= p.mid_term_sixty_evaluation_date and Date.today <= p.mid_term_evaluation_date and p.mid_term_evaluation.blank? and !p.acceptance_status.blank? }
    end
  end

  def self.upcoming_end_term_evaluations(user)
    if user.admin?
      return Project.all.select{|p| Date.today >= p.end_term_evaluation_date and Date.today <=  p.end_date and p.end_term_evaluation.blank? and !p.acceptance_status.blank? }
    else
      return Project.where("user_id = ?", user.id).select{|p| Date.today >= p.end_term_evaluation_date and Date.today <=  p.end_date and p.end_term_evaluation.blank? and !p.acceptance_status.blank? }
    end
  end

  def self.missed_mid_term_evaluations(user)
    if user.admin?
      return Project.all.select{|p| p.mid_term_evaluation_date < Date.today and p.mid_term_evaluation.blank? and !p.acceptance_status.blank? }
    else
      return Project.where("user_id = ?", user.id).select{|p| p.mid_term_evaluation_date < Date.today and p.mid_term_evaluation.blank? and !p.acceptance_status.blank? }
    end
  end

  def self.missed_end_term_evaluations(user)
    if user.admin?
      return Project.all.select{|p| p.end_date < Date.today and p.end_term_evaluation.blank? and !p.acceptance_status.blank? }
    else
      return Project.where("user_id = ?", user.id).select{|p| p.end_date < Date.today and p.end_term_evaluation.blank? and !p.acceptance_status.blank? }
    end
  end

  def self.acceptance_pending_proposals(user)
    if user.admin?
      return Project.all.select{|p| p.acceptance_status.blank? } 
    else
      return Project.where("user_id = ?", user.id).select{|p| p.acceptance_status.blank? }
    end
  end

  def mid_term_evaluation
    evaluations.where('project_evaluation_type = ?', Evaluation::MID_TERM)
  end

  def end_term_evaluation
    evaluations.where('project_evaluation_type = ?', Evaluation::END_TERM)
  end

  def status
    Date.today < start_date ? 'Not Started' : ((Date.today >= start_date and Date.today <= end_date) ? 'Ongoing' : (Date.today > end_date ? 'Deadline Passed' : '') )
  end

  def to_s
    project_title
  end
  
end
