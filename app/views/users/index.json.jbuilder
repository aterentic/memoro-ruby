json.array!(@users) do |user|
  json.extract! user, :email
  json.url user_url(user, format: :json)
end
