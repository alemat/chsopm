class PerformanceReportsController < ApplicationController
  before_action :set_performance_report, only: [:show, :edit, :update, :destroy]

  # GET /performance_reports
  # GET /performance_reports.json
  def index
    @performance_reports = PerformanceReport.all
  end

  # GET /performance_reports/1
  # GET /performance_reports/1.json
  def show
  end

  # GET /performance_reports/new
  def new
    @performance_report = PerformanceReport.new
  end

  # GET /performance_reports/1/edit
  def edit
  end

  # POST /performance_reports
  # POST /performance_reports.json
  def create
    @performance_report = PerformanceReport.new(performance_report_params)

    respond_to do |format|
      if @performance_report.save
        format.html { redirect_to @performance_report, notice: 'Performance report was successfully created.' }
        format.json { render :show, status: :created, location: @performance_report }
      else
        format.html { render :new }
        format.json { render json: @performance_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /performance_reports/1
  # PATCH/PUT /performance_reports/1.json
  def update
    respond_to do |format|
      if @performance_report.update(performance_report_params)
        format.html { redirect_to @performance_report, notice: 'Performance report was successfully updated.' }
        format.json { render :show, status: :ok, location: @performance_report }
      else
        format.html { render :edit }
        format.json { render json: @performance_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /performance_reports/1
  # DELETE /performance_reports/1.json
  def destroy
    @performance_report.destroy
    respond_to do |format|
      format.html { redirect_to performance_reports_url, notice: 'Performance report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_performance_report
      @performance_report = PerformanceReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def performance_report_params
      params.require(:performance_report).permit(:project_id, :reporting_type_id, :remark, :performance_report_file)
    end
end
