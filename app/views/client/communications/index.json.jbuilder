json.array!(@client_communications) do |client_communication|
  json.extract! client_communication, :id, :name, :client, :backup, :backup_maintenance
  json.url client_communication_url(client_communication, format: :json)
end
