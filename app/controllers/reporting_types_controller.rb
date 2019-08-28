class ReportingTypesController < ApplicationController
  before_action :set_reporting_type, only: [:show, :edit, :update, :destroy]
  
  # GET /reporting_types
  # GET /reporting_types.json
  def index
    @reporting_types = ReportingType.all
  end

  # GET /reporting_types/1
  # GET /reporting_types/1.json
  def show
  end

  # GET /reporting_types/new
  def new
    @reporting_type = ReportingType.new
  end

  # GET /reporting_types/1/edit
  def edit
  end

  # POST /reporting_types
  # POST /reporting_types.json
  def create
    @reporting_type = ReportingType.new(reporting_type_params)

    respond_to do |format|
      if @reporting_type.save
        format.html { redirect_to reporting_types_path, notice: 'Reporting type was successfully created.' }
        format.json { render :show, status: :created, location: @reporting_type }
      else
        format.html { render :new }
        format.json { render json: @reporting_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reporting_types/1
  # PATCH/PUT /reporting_types/1.json
  def update
    respond_to do |format|
      if @reporting_type.update(reporting_type_params)
        format.html { redirect_to @reporting_type, notice: 'Reporting type was successfully updated.' }
        format.json { render :show, status: :ok, location: @reporting_type }
      else
        format.html { render :edit }
        format.json { render json: @reporting_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reporting_types/1
  # DELETE /reporting_types/1.json
  def destroy
    @reporting_type.destroy
    respond_to do |format|
      format.html { redirect_to reporting_types_url, notice: 'Reporting type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reporting_type
      @reporting_type = ReportingType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reporting_type_params
      params.require(:reporting_type).permit(:name)
    end
end
