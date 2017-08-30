class ChangeItemsBTask < ActiveRecord::Migration[5.0]
  def change
    rename_column :b_tasks, :status, :status_name
    rename_column :b_tasks, :communication, :communication_name
  end
end
