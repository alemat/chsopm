class PerformanceReport < ApplicationRecord
  belongs_to :project
  belongs_to :reporting_type
end