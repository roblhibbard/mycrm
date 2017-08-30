json.array!(@client_client_assets) do |client_client_asset|
  json.extract! client_client_asset, :id, :make, :model, :operating_system, :user_login, :user_password, :other_items, :computer_id, :labtech_name
  json.url client_client_asset_url(client_client_asset, format: :json)
end
