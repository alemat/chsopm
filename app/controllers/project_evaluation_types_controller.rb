class ProjectEvaluationTypesController < ApplicationController
  before_action :set_project_evaluation_type, only: [:show, :edit, :update, :destroy]

  # GET /project_evaluation_types
  # GET /project_evaluation_types.json
  def index
    @project_evaluation_types = ProjectEvaluationType.all
  end

  # GET /project_evaluation_types/1
  # GET /project_evaluation_types/1.json
  def show
  end

  # GET /project_evaluation_types/new
  def new
    @project_evaluation_type = ProjectEvaluationType.new
  end

  # GET /project_evaluation_types/1/edit
  def edit
  end

  # POST /project_evaluation_types
  # POST /project_evaluation_types.json
  def create
    @project_evaluation_type = ProjectEvaluationType.new(project_evaluation_type_params)

    respond_to do |format|
      if @project_evaluation_type.save
        format.html { redirect_to @project_evaluation_type, notice: 'Project evaluation type was successfully created.' }
        format.json { render :show, status: :created, location: @project_evaluation_type }
      else
        format.html { render :new }
        format.json { render json: @project_evaluation_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_evaluation_types/1
  # PATCH/PUT /project_evaluation_types/1.json
  def update
    respond_to do |format|
      if @project_evaluation_type.update(project_evaluation_type_params)
        format.html { redirect_to @project_evaluation_type, notice: 'Project evaluation type was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_evaluation_type }
      else
        format.html { render :edit }
        format.json { render json: @project_evaluation_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_evaluation_types/1
  # DELETE /project_evaluation_types/1.json
  def destroy
    @project_evaluation_type.destroy
    respond_to do |format|
      format.html { redirect_to project_evaluation_types_url, notice: 'Project evaluation type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_evaluation_type
      @project_evaluation_type = ProjectEvaluationType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_evaluation_type_params
      params.require(:project_evaluation_type).permit(:name)
    end
end
