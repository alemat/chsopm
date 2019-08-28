class CreateProjectExtentions < ActiveRecord::Migration[5.2]
  def change
    create_table :project_extentions do |t|
      t.references :project, foreign_key: true
      t.string :subject
      t.boolean :activity_change
      t.boolean :budget_change
      t.boolean :ia_change
      t.boolean :within_project_duration
      t.boolean :approval_status

      t.timestamps
    end
  end
end
