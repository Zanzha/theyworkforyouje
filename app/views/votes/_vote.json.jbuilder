json.extract! vote, :id, :proposition_id, :type, :created_at, :updated_at
json.url vote_url(vote, format: :json)
