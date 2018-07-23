class SubFocusArea < ApplicationRecord
  belongs_to :focus_area
  has_many :projects, through: :focus_area

  def to_s
    name
  end
  
end
