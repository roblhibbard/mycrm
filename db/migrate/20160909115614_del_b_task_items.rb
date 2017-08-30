class DelBTaskItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :b_tasks, :backup_account, :status_name, :communication_name
  end
end
