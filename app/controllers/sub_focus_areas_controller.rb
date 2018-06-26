class SubFocusAreasController < ApplicationController
  before_action :set_sub_focus_area, only: [:show, :edit, :update, :destroy]

  # GET /sub_focus_areas
  # GET /sub_focus_areas.json
  def index
    @sub_focus_areas = SubFocusArea.all
  end

  # GET /sub_focus_areas/1
  # GET /sub_focus_areas/1.json
  def show
  end

  # GET /sub_focus_areas/new
  def new
    @sub_focus_area = SubFocusArea.new
  end

  # GET /sub_focus_areas/1/edit
  def edit
  end

  # POST /sub_focus_areas
  # POST /sub_focus_areas.json
  def create
    @sub_focus_area = SubFocusArea.new(sub_focus_area_params)

    respond_to do |format|
      if @sub_focus_area.save
        format.html { redirect_to @sub_focus_area, notice: 'Sub focus area was successfully created.' }
        format.json { render :show, status: :created, location: @sub_focus_area }
      else
        format.html { render :new }
        format.json { render json: @sub_focus_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_focus_areas/1
  # PATCH/PUT /sub_focus_areas/1.json
  def update
    respond_to do |format|
      if @sub_focus_area.update(sub_focus_area_params)
        format.html { redirect_to @sub_focus_area, notice: 'Sub focus area was successfully updated.' }
        format.json { render :show, status: :ok, location: @sub_focus_area }
      else
        format.html { render :edit }
        format.json { render json: @sub_focus_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_focus_areas/1
  # DELETE /sub_focus_areas/1.json
  def destroy
    @sub_focus_area.destroy
    respond_to do |format|
      format.html { redirect_to sub_focus_areas_url, notice: 'Sub focus area was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_focus_area
      @sub_focus_area = SubFocusArea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_focus_area_params
      params.require(:sub_focus_area).permit(:focus_area_id, :name, :description)
    end
end
