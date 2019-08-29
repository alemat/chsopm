class AddShortNameToProgramAreas < ActiveRecord::Migration[5.2]
  def change
    add_column :program_areas, :short_name, :string
  end
end
