class AddIndexToTaskOptions < ActiveRecord::Migration[5.0]
  def change
    add_reference :task_options, :todo_list, index: true
  end
end
