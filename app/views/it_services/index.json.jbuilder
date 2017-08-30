json.array!(@it_services) do |it_service|
  json.extract! it_service, :id, :name, :description, :rate, :active
  json.url it_service_url(it_service, format: :json)
end
