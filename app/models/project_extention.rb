class ProjectExtention < ApplicationRecord
  belongs_to :project
  has_one_attached :amendment_details


  def project_approval_status
  	approval_status.blank? ? 'Pending' : 'Approved'
  end
end
