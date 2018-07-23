class CreatePerformanceReports < ActiveRecord::Migration[5.2]
  def change
    create_table :performance_reports do |t|
      t.references :project, foreign_key: true
      t.references :reporting_type, foreign_key: true
      t.text :remark

      t.timestamps
    end
  end
end
