class Funder < ApplicationRecord
  belongs_to :project
  belongs_to :institution
end
