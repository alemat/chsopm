class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :project_title
      t.references :institution, foreign_key: true
      t.references :focus_area, foreign_key: true
      t.references :sub_focus_area, foreign_key: true
      t.text :project_details
      t.references :project_status, foreign_key: true
      t.integer :direct_beneficiaries
      t.integer :indirect_beneficiaries
      t.date :start_date
      t.date :end_date
      t.float :total_budget
      t.float :program_budget
      t.float :admin_budget
      t.references :funding_status, foreign_key: true
      t.references :reporting_type, foreign_key: true
      t.string :project_focal_person
      t.string :phone_number
      t.string :email

      t.timestamps
    end
  end
end
