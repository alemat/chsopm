class Institution < ApplicationRecord
  belongs_to :institution_type
  belongs_to :institution_status
  belongs_to :region
end
