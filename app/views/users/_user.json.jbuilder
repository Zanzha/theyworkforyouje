json.extract! notice, :id, :username, :email, :created_at, :updated_at
json.url user_url(notice, format: :json)
