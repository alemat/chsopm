json.extract! funder, :id, :project_id, :institution_id, :amount, :created_at, :updated_at
json.url funder_url(funder, format: :json)
