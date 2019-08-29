class ProjectExtention < ApplicationRecord
  belongs_to :project
  has_one_attached :amendment_details


  def self.approval_pending_amendments
    return ProjectExtention.all
  end

  def project_extention_approval_status
  	approval_status.blank? ? 'Pending' : 'Approved'
  end
  
end
