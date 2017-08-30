json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :ticket_title, :issue, :priority, :description, :due_date, :tech, :client_id
  json.url ticket_url(ticket, format: :json)
end
