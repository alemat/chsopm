class AddDetailsToProjectExtention < ActiveRecord::Migration[5.2]
  def change
    add_column :project_extentions, :details, :text
  end
end
