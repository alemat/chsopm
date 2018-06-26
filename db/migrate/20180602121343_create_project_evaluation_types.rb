class CreateProjectEvaluationTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :project_evaluation_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
