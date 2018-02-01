json.extract! task, :id, :name, :start, :deadline, :status, :user_id, :created_at, :updated_at
json.url task_url(task, format: :json)
