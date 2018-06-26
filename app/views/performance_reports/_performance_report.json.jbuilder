json.extract! performance_report, :id, :project_id, :reporting_type_id, :remark, :performance_report_file, :created_at, :updated_at
json.url performance_report_url(performance_report, format: :json)
