class PerformanceReport < ApplicationRecord
  belongs_to :project
  belongs_to :reporting_type
  has_one_attached :reports
end
