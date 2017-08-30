json.array!(@backup_backup_maintenances) do |backup_backup_maintenance|
  json.extract! backup_backup_maintenance, :id, :date, :last_backup, :client_items_id, :client_id, :notes
  json.url backup_backup_maintenance_url(backup_backup_maintenance, format: :json)
end
