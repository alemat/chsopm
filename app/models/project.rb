class Project < ApplicationRecord
  belongs_to :institution
  belongs_to :focus_area
  belongs_to :sub_focus_area
  belongs_to :project_status
  belongs_to :funding_status
  belongs_to :reporting_type
  has_many :funders
  has_many :implementation_areas
  has_many :evaluations
  has_many :performance_reports

  accepts_nested_attributes_for :funders, allow_destroy: true
  accepts_nested_attributes_for :implementation_areas, allow_destroy: true

  validates :project_title, :start_date, :end_date, presence: true
  validate :end_date_must_be_after_start_date


  def end_date_must_be_after_start_date
    if end_date < start_date
      errors.add(:end_date, 'must be after start date')
    end
  end

  def mid_term_evaluation_date
    difference_days = (end_date - start_date).to_i
    return start_date + difference_days/2
  end

  def end_term_evaluation_date
    return end_date - 10
  end

  def self.upcoming_mid_term_evaluations
    return Project.all.select{|p| p.mid_term_evaluation_date > Date.today and p.mid_term_evaluation.blank? }
  end

  def self.upcoming_end_term_evaluations
    return Project.where('end_date > ?', Date.today - 10).select{|p| p.end_term_evaluation.blank? }
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

  def to_s
    project_title
  end
  
end
