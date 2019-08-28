json.extract! project_extention, :id, :project_id, :subject, :activity_change, :budget_change, :ia_change, :within_project_duration, :approval_status, :created_at, :updated_at
json.url project_extention_url(project_extention, format: :json)
