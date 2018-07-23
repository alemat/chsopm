class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  def project_by_region
    projects = Project.joins(:implementation_areas=>:region).group('regions.name').count
    render json: projects
  end

  def projects_by_sub_focus_area
    sub_focus_area = SubFocusArea.find(params[:sub_focus_area])
    projects = sub_focus_area.projects.joins(:implementation_areas=>:region).group('regions.name').count
    render json: projects
  end

  def projects_by_focus_area
    focus_area = FocusArea.find(params[:focus_area])
    projects = focus_area.projects.joins(:implementation_areas=>:region).group('regions.name').count
    render json: projects
  end
  
  def upcoming_mid_term_evaluations
    @projects = Project.upcoming_mid_term_evaluations
  end

  def upcoming_end_term_evaluations
    @projects = Project.upcoming_end_term_evaluations
  end

  def missed_mid_term_evaluations
    @projects = Project.missed_mid_term_evaluations
  end

  def missed_end_term_evaluations
    @projects = Project.missed_end_term_evaluations
  end

  def load_sub_focus_areas
    @focus_area = FocusArea.find(params[:focus_area])
    @sub_focus_areas = @focus_area.sub_focus_areas
    render partial: 'sub_focus_area'
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
    @sub_focus_areas = []
  end

  # GET /projects/1/edit
  def edit
    @sub_focus_areas = @project.focus_area.sub_focus_areas
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:project_title, :institution_id, :focus_area_id, :sub_focus_area_id, :project_details, :project_status_id, 
        :direct_beneficiaries, :indirect_beneficiaries, :start_date, :end_date, :total_budget, :program_budget, :admin_budget, :funding_status_id, 
        :reporting_type_id, :project_focal_person, :phone_number, :email, 
        funders_attributes: [:id, :project_id, :institution_id, :amount, :_destroy], 
        implementation_areas_attributes: [:id, :project_id, :region_id, :zone, :district, :contact_person, :phone_number, :email, :_destroy] )
    end
end
