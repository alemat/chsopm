class FundingInstsController < ApplicationController
  before_action :set_funding_inst, only: [:show, :edit, :update, :destroy]

  # GET /funding_insts
  # GET /funding_insts.json
  def index
    @funding_insts = FundingInst.all
  end

  # GET /funding_insts/1
  # GET /funding_insts/1.json
  def show
  end

  # GET /funding_insts/new
  def new
    @funding_inst = FundingInst.new
  end

  # GET /funding_insts/1/edit
  def edit
  end

  # POST /funding_insts
  # POST /funding_insts.json
  def create
    @funding_inst = FundingInst.new(funding_inst_params)

    respond_to do |format|
      if @funding_inst.save
        format.html { redirect_to @funding_inst, notice: 'Funding inst was successfully created.' }
        format.json { render :show, status: :created, location: @funding_inst }
      else
        format.html { render :new }
        format.json { render json: @funding_inst.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /funding_insts/1
  # PATCH/PUT /funding_insts/1.json
  def update
    respond_to do |format|
      if @funding_inst.update(funding_inst_params)
        format.html { redirect_to @funding_inst, notice: 'Funding inst was successfully updated.' }
        format.json { render :show, status: :ok, location: @funding_inst }
      else
        format.html { render :edit }
        format.json { render json: @funding_inst.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funding_insts/1
  # DELETE /funding_insts/1.json
  def destroy
    @funding_inst.destroy
    respond_to do |format|
      format.html { redirect_to funding_insts_url, notice: 'Funding inst was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_funding_inst
      @funding_inst = FundingInst.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def funding_inst_params
      params.require(:funding_inst).permit(:name, :about, :website, :phone, :email)
    end
end
