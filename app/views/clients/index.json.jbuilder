json.array!(@clients) do |client|
  json.extract! client, :id, :first_name, :last_name, :phone_number, :address, :state, :zip_code, :email
  json.url client_url(client, format: :json)
end
