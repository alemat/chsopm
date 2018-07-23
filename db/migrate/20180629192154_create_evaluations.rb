class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.references :project, foreign_key: true
      t.string :project_evaluation_type
      t.text :remark

      t.timestamps
    end
  end
end
