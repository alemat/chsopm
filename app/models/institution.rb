class Institution < ApplicationRecord
  belongs_to :institution_type
  belongs_to :institution_status
  belongs_to :region
  has_many :funders
  has_one_attached :image

  def to_s
    name
  end
  
end
