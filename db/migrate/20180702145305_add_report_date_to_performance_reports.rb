class AddReportDateToPerformanceReports < ActiveRecord::Migration[5.2]
  def change
    add_column :performance_reports, :report_date, :date
  end
end
