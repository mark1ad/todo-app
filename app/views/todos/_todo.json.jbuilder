json.extract! todo, :id, :todo, :completed, :created_at, :updated_at
json.url todo_url(todo, format: :json)
