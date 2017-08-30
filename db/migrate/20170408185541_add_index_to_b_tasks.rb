class AddIndexToBTasks < ActiveRecord::Migration[5.0]
  def change
    add_reference :b_tasks, :todo_list, index: true
  end
end
