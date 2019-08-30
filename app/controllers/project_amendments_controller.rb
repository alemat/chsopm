class ProjectAmendmentsController < ApplicationController
  before_action :set_project_amendment, only: [:show, :edit, :update, :destroy, :approve]

  # GET /project_amendments
  # GET /project_amendments.json
  def index
    @project_amendments = ProjectAmendment.all
  end

  # GET /project_amendments/1
  # GET /project_amendments/1.json
  def show
    
  end

  # GET /project_amendments/new
  def new
    @project_amendment = ProjectAmendment.new
    @project_amendment.project_id = params[:project]
  end


  def approval_pending_extentions
    @project_amendments = ProjectAmendment.all
  end

  # GET /project_amendments/1/edit
  def edit
  end

  def approve
    @project_amendment.update_attribute('approval_status', true)
    flash[:notice] = 'Project extention request successfully approved.'
    redirect_to action: 'show'
  end

  # POST /project_amendments
  # POST /project_amendments.json
  def create
    @project_amendment = ProjectAmendment.new(project_amendment_params)
    @project_amendment.approval_status = true if current_user.admin

    respond_to do |format|
      if @project_amendment.save
        @project_amendment.project.update(project_status: Project::AMENDED)
        format.html { redirect_to @project_amendment.project, notice: 'Project amendment was successfully created.' }
        format.json { render :show, status: :created, location: @project_amendment }
      else
        format.html { render :new }
        format.json { render json: @project_amendment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_amendments/1
  # PATCH/PUT /project_amendments/1.json
  def update
    respond_to do |format|
      if @project_amendment.update(project_amendment_params)
        format.html { redirect_to @project_amendment, notice: 'Project amendment was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_amendment }
      else
        format.html { render :edit }
        format.json { render json: @project_amendment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_amendments/1
  # DELETE /project_amendments/1.json
  def destroy
    @project_amendment.destroy
    respond_to do |format|
      format.html { redirect_to project_amendments_url, notice: 'Project amendment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_amendment
      @project_amendment = ProjectAmendment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_amendment_params
      params.require(:project_amendment).permit(:project_id, :from, :to, :amendment_reason, :approval_status, :extention_file)
    end
end
