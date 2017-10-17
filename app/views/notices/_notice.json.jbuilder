json.extract! notice, :id, :user_id, :title, :content, :created_at, :updated_at
json.url notice_url(notice, format: :json)
