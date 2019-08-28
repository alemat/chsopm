class ImplementationAreasController < ApplicationController
  before_action :set_implementation_area, only: [:show, :edit, :update, :destroy]

  # GET /implementation_areas
  # GET /implementation_areas.json
  def index
    @implementation_areas = ImplementationArea.all
  end

  # GET /implementation_areas/1
  # GET /implementation_areas/1.json
  def show
  end

  # GET /implementation_areas/new
  def new
    @implementation_area = ImplementationArea.new
  end

  # GET /implementation_areas/1/edit
  def edit
  end

  # POST /implementation_areas
  # POST /implementation_areas.json
  def create
    @implementation_area = ImplementationArea.new(implementation_area_params)

    respond_to do |format|
      if @implementation_area.save
        format.html { redirect_to @implementation_area, notice: 'Implementation area was successfully created.' }
        format.json { render :show, status: :created, location: @implementation_area }
      else
        format.html { render :new }
        format.json { render json: @implementation_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /implementation_areas/1
  # PATCH/PUT /implementation_areas/1.json
  def update
    respond_to do |format|
      if @implementation_area.update(implementation_area_params)
        format.html { redirect_to @implementation_area, notice: 'Implementation area was successfully updated.' }
        format.json { render :show, status: :ok, location: @implementation_area }
      else
        format.html { render :edit }
        format.json { render json: @implementation_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /implementation_areas/1
  # DELETE /implementation_areas/1.json
  def destroy
    @implementation_area.destroy
    respond_to do |format|
      format.html { redirect_to implementation_areas_url, notice: 'Implementation area was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_implementation_area
      @implementation_area = ImplementationArea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def implementation_area_params
      params.require(:implementation_area).permit(:project_id, :region_id, :zone, :district, :contact_person, :phone_number, :email, :allocated_budget)
    end
end
