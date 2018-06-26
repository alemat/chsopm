class CreateSubFocusAreas < ActiveRecord::Migration[5.1]
  def change
    create_table :sub_focus_areas do |t|
      t.references :focus_area, foreign_key: true
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
