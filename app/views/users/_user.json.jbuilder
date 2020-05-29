json.extract! user, :id, :firstName, :secondName, :email, :created_at, :updated_at
json.url user_url(user, format: :json)
