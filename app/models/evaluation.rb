class Evaluation < ApplicationRecord
  belongs_to :project
  has_one_attached :evaluation_file
  has_many :evaluators

  accepts_nested_attributes_for :evaluators

  EVALUATION_TYPES = [MID_TERM='Mid Term Evaluation', END_TERM='End Term Evaluation']

  def to_s
  	project
  end
end
