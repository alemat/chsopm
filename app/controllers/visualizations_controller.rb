class VisualizationsController < ApplicationController
  def index
    @sub_focus_areas = []
  end

  def load_sub_focus_areas
    @focus_area = FocusArea.find(params[:focus_area])
    @sub_focus_areas = @focus_area.sub_focus_areas
    render partial: 'sub_focus_area'
  end

  def load_projects_by_sub_focus_area
  	@sub_focus_area = SubFocusArea.find(params[:sub_focus_area])
  	render partial: 'chart'
  end

  def load_projects_by_focus_area
    @focus_area = FocusArea.find(params[:focus_area])
    render partial: 'chart'
  end

end
