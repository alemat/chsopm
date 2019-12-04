class Funder < ApplicationRecord
  belongs_to :project
  belongs_to :institution, optional: true
  belongs_to :funding_inst
end
