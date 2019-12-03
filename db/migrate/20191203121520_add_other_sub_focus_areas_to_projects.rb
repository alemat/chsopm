class AddOtherSubFocusAreasToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :other_sub_focus_areas, :text
  end
end
