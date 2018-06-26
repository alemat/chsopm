class CreateImplementationAreas < ActiveRecord::Migration[5.1]
  def change
    create_table :implementation_areas do |t|
      t.references :project, foreign_key: true
      t.references :region, foreign_key: true
      t.string :zone
      t.string :district
      t.string :contact_person
      t.string :phone_number
      t.string :email

      t.timestamps
    end
  end
end
