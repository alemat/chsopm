class ProjectExtention < ApplicationRecord
  belongs_to :project
  has_one_attached :amendment_details


  def project_approval_status
  	return approval_status == true ? 'Approved' : 'Pending'
  end
end
