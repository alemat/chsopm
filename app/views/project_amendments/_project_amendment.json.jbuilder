json.extract! project_amendment, :id, :project_id, :from, :to, :amendment_reason, :created_at, :updated_at
json.url project_amendment_url(project_amendment, format: :json)
