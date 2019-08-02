class HomeController < ApplicationController
  def index
  	@projects = Project.all
  	@focus_areas = FocusArea.all
  end
end
