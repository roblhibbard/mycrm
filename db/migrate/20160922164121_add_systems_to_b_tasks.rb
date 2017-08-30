class AddSystemsToBTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :b_tasks, :system, :string
  end
end
