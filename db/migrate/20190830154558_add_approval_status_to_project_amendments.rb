class AddApprovalStatusToProjectAmendments < ActiveRecord::Migration[5.2]
  def change
    add_column :project_amendments, :approval_status, :boolean
  end
end
