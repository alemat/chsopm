class AddAcceptanceStatusToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :acceptance_status, :boolean
  end
end
