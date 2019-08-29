class ProjectExtentionsController < ApplicationController
  before_action :set_project_extention, only: [:show, :edit, :update, :destroy, :approve]

  # GET /project_extentions
  # GET /project_extentions.json
  def index
    @project_extentions = ProjectExtention.all
  end

  # GET /project_extentions/1
  # GET /project_extentions/1.json
  def show
  end

  # GET /project_extentions/new
  def new
    @project_extention = ProjectExtention.new
    @project_extention.project_id = params[:project]
  end

  # GET /project_extentions/1/edit
  def edit
  end

  def approve
    @project_extention.update_attribute('approval_status', true)
    flash[:notice] = 'Project amendment request successfully approved.'
    redirect_to action: 'show'
  end

  # POST /project_extentions
  # POST /project_extentions.json
  def create
    @project_extention = ProjectExtention.new(project_extention_params)
    @project_extention.approval_status = true if current_user.admin
    respond_to do |format|
      if @project_extention.save
        format.html { redirect_to @project_extention, notice: 'Project extention was successfully created.' }
        format.json { render :show, status: :created, location: @project_extention }
      else
        format.html { render :new }
        format.json { render json: @project_extention.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_extentions/1
  # PATCH/PUT /project_extentions/1.json
  def update
    respond_to do |format|
      if @project_extention.update(project_extention_params)
        format.html { redirect_to @project_extention, notice: 'Project extention was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_extention }
      else
        format.html { render :edit }
        format.json { render json: @project_extention.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_extentions/1
  # DELETE /project_extentions/1.json
  def destroy
    @project_extention.destroy
    respond_to do |format|
      format.html { redirect_to project_extentions_url, notice: 'Project extention was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_extention
      @project_extention = ProjectExtention.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_extention_params
      params.require(:project_extention).permit(:project_id, :subject, :activity_change, :budget_change, :ia_change, :within_project_duration, :approval_status, :details, :amendment_details)
    end
end
