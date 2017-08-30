json.array!(@ticket_comments) do |ticket_comment|
  json.extract! ticket_comment, :id, :name, :content
  json.url ticket_comment_url(ticket_comment, format: :json)
end
