class ProjectAmendment < ApplicationRecord
  belongs_to :project
  has_one_attached :extention_file

  def project_amendment_approval_status
  	approval_status.blank? ? 'Pending' : 'Approved'
  end

  def  self.approval_pending_extentions
  	return ProjectAmendments.all 
  end

end
