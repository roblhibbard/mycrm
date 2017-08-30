json.array!(@priorities) do |priority|
  json.extract! priority, :id, :, :client_id
  json.url priority_url(priority, format: :json)
end
