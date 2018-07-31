class InstitutionStatusesController < ApplicationController
  before_action :set_institution_status, only: [:show, :edit, :update, :destroy]
  protect_from_forgery with: :null_session

  # GET /institution_statuses
  # GET /institution_statuses.json
  def index
    @institution_statuses = InstitutionStatus.all
  end

  # GET /institution_statuses/1
  # GET /institution_statuses/1.json
  def show
  end

  # GET /institution_statuses/new
  def new
    @institution_status = InstitutionStatus.new
  end

  # GET /institution_statuses/1/edit
  def edit
  end

  # POST /institution_statuses
  # POST /institution_statuses.json
  def create
    @institution_status = InstitutionStatus.new(institution_status_params)

    respond_to do |format|
      if @institution_status.save
        format.html { redirect_to @institution_status, notice: 'Institution status was successfully created.' }
        format.json { render :show, status: :created, location: @institution_status }
      else
        format.html { render :new }
        format.json { render json: @institution_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /institution_statuses/1
  # PATCH/PUT /institution_statuses/1.json
  def update
    respond_to do |format|
      if @institution_status.update(institution_status_params)
        format.html { redirect_to @institution_status, notice: 'Institution status was successfully updated.' }
        format.json { render :show, status: :ok, location: @institution_status }
      else
        format.html { render :edit }
        format.json { render json: @institution_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /institution_statuses/1
  # DELETE /institution_statuses/1.json
  def destroy
    @institution_status.destroy
    respond_to do |format|
      format.html { redirect_to institution_statuses_url, notice: 'Institution status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_institution_status
      @institution_status = InstitutionStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def institution_status_params
      params.require(:institution_status).permit(:name)
    end
end
