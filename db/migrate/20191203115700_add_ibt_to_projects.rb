class AddIbtToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :ibt, :string
  end
end
