class CreateProjectAmendments < ActiveRecord::Migration[5.1]
  def change
    create_table :project_amendments do |t|
      t.references :project, foreign_key: true
      t.date :from
      t.date :to
      t.text :amendment_reason

      t.timestamps
    end
  end
end
