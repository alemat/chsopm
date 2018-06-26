class CreateEvaluations < ActiveRecord::Migration[5.1]
  def change
    create_table :evaluations do |t|
      t.references :project, foreign_key: true
      t.references :project_evaluation_type, foreign_key: true
      t.string :evaluator_full_name
      t.text :remark
      t.attachment :evaluation_file

      t.timestamps
    end
  end
end
