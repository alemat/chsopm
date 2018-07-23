class AddEvaluationDateToEvaluations < ActiveRecord::Migration[5.2]
  def change
    add_column :evaluations, :evaluation_date, :date
  end
end
