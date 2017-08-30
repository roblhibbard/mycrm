 json.array!(@labtech_clients) do |labtech_client|
  json.extract! labtech_client, :ClientID, :name, :address, :Firstname, :LastName, :Company, :Address1, Address2, :City
  json.url labtech__client_url(labtech_client, format: :json)
  end
