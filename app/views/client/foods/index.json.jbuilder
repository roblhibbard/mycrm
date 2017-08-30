json.array!(@client_foods) do |client_food|
  json.extract! client_food, :id, :name
  json.url client_food_url(client_food, format: :json)
end
