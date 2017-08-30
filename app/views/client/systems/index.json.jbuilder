json.array!(@client_systems) do |client_system|
  json.extract! client_system, :id, :make, :model, :operating_system, :user_login, :user_password, :other_items, :computer_id, :labtech_name
  json.url client_system_url(client_system, format: :json)
end
