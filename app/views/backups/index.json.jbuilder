json.array!(@backups) do |backup|
  json.extract! backup, :id, :notes, :client_id
  json.url backup_url(backup, format: :json)
end
