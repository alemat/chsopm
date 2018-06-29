class Project < ApplicationRecord
  belongs_to :institution
  belongs_to :focus_area
  belongs_to :sub_focus_area
  belongs_to :project_status
  belongs_to :funding_status
  belongs_to :reporting_type
  has_many :funders
  has_many :implementation_areas

  accepts_nested_attributes_for :funders
  accepts_nested_attributes_for :implementation_areas

  def to_s
    project_title
  end
  
end
