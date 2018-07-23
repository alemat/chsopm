class ImplementationArea < ApplicationRecord
  belongs_to :project
  belongs_to :region

  def to_s
  	region.name
  end
end
