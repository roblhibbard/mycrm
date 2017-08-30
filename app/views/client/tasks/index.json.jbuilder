json.array!(@client_tasks) do |client_task|
  json.extract! client_task, :id, :name, :client, :backup, :backup_maintenance
  json.url client_task_url(client_task, format: :json)
end
