class AddHoursToBTask < ActiveRecord::Migration[5.0]
  def change
    add_column :b_tasks, :task_time, :integer
  end
end
