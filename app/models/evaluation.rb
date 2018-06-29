class Evaluation < ApplicationRecord
  belongs_to :project
  belongs_to :project_evaluation_type

  def to_s
    name
  end
  
end
