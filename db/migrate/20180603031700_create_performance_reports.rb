class CreatePerformanceReports < ActiveRecord::Migration[5.1]
  def change
    create_table :performance_reports do |t|
      t.references :project, foreign_key: true
      t.references :reporting_type, foreign_key: true
      t.text :remark
      t.attachment :performance_report_file

      t.timestamps
    end
  end

  def self.up
    change_table :performance_reports do |t|
      t.attachment :performance_report_file
    end
  end

  def self.down
    remove_attachment :performance_reports, :performance_report_file
  end
end
