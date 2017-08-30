json.array!(@communications) do |communication|
  json.extract! communication, :id, :name, :client_id
  json.url communication_url(communication, format: :json)
end
