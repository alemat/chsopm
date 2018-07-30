class PerformanceReport < ApplicationRecord
  belongs_to :project
  belongs_to :reporting_type
  has_one_attached :reports



  def performance_report_status
    return status == true ? 'Submitted' : 'Not Submitted'
  end

end
