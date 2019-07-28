class ReportsController < ApplicationController
  def project_report
  	@projects = []
    if request.post?
      @projects = Project.search(params[:report][:focus_area], params[:report][:sub_focus_area], params[:report][:region])
      respond_to do |format|
        format.js
        format.html
      end
    end
  end
end
