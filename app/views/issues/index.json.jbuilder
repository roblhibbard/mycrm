json.array!(@issues) do |issue|
  json.extract! issue, :id, :name, :client_id
  json.url issue_url(issue, format: :json)
end
