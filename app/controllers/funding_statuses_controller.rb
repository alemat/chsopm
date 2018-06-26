class FundingStatusesController < ApplicationController
  before_action :set_funding_status, only: [:show, :edit, :update, :destroy]

  # GET /funding_statuses
  # GET /funding_statuses.json
  def index
    @funding_statuses = FundingStatus.all
  end

  # GET /funding_statuses/1
  # GET /funding_statuses/1.json
  def show
  end

  # GET /funding_statuses/new
  def new
    @funding_status = FundingStatus.new
  end

  # GET /funding_statuses/1/edit
  def edit
  end

  # POST /funding_statuses
  # POST /funding_statuses.json
  def create
    @funding_status = FundingStatus.new(funding_status_params)

    respond_to do |format|
      if @funding_status.save
        format.html { redirect_to @funding_status, notice: 'Funding status was successfully created.' }
        format.json { render :show, status: :created, location: @funding_status }
      else
        format.html { render :new }
        format.json { render json: @funding_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /funding_statuses/1
  # PATCH/PUT /funding_statuses/1.json
  def update
    respond_to do |format|
      if @funding_status.update(funding_status_params)
        format.html { redirect_to @funding_status, notice: 'Funding status was successfully updated.' }
        format.json { render :show, status: :ok, location: @funding_status }
      else
        format.html { render :edit }
        format.json { render json: @funding_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funding_statuses/1
  # DELETE /funding_statuses/1.json
  def destroy
    @funding_status.destroy
    respond_to do |format|
      format.html { redirect_to funding_statuses_url, notice: 'Funding status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_funding_status
      @funding_status = FundingStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def funding_status_params
      params.require(:funding_status).permit(:name)
    end
end
