json.array!(@signups) do |signup|
  json.extract! signup, :id, :name, :email, :phone_number
  json.url signup_url(signup, format: :json)
end
