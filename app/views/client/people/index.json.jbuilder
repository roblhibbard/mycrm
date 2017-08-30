json.array!(@client_people) do |client_person|
  json.extract! client_person, :id, :name
  json.url client_person_url(client_person, format: :json)
end
