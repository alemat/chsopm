class Project < ApplicationRecord
  belongs_to :institution
  belongs_to :focus_area
  belongs_to :sub_focus_area
  belongs_to :project_status
  belongs_to :funding_status
  belongs_to :reporting_type
end
