class CreateInstitutions < ActiveRecord::Migration[5.1]
  def change
    create_table :institutions do |t|
      t.string :name
      t.string :short_name
      t.references :institution_type, foreign_key: true
      t.references :institution_status, foreign_key: true
      t.integer :license_no
      t.string :url
      t.text :about_institution
      t.references :region, foreign_key: true
      t.string :district
      t.string :office_phone
      t.string :office_email
      t.string :p_o_box
      t.string :fax_number
      t.string :contact_person
      t.string :contact_phone
      t.string :contact_email

      t.timestamps
    end
  end
end
