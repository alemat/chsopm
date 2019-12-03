class AddDbtToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :dbt, :string
  end
end
