class Evaluation < ApplicationRecord
  belongs_to :project
  belongs_to :project_evaluation_type
end
