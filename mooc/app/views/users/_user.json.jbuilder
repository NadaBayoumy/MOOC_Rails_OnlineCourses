json.extract! user, :id, :name, :email, :password, :birthdate, :gender, :picture, :created_at, :updated_at
json.url user_url(user, format: :json)
