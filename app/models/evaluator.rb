class Evaluator < ApplicationRecord
  belongs_to :evaluation

  def to_s
  	full_name
  end
end
