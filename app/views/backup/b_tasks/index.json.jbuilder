json.array!(@backup_b_tasks) do |backup_b_task|
  json.extract! backup_b_task, :id, :backup_account, :details, :description, :status, :communication, :status_id, :communication_id
  json.url backup_b_task_url(backup_b_task, format: :json)
end
