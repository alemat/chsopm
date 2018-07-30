class AddReportStatusToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :report_status, :string
  end
end
