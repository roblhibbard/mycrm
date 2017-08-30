class AddIndicesToTasks < ActiveRecord::Migration[5.0]
  def change
    add_reference :todo_lists, :backup, index: true
    add_reference :todo_lists, :client, index: true
    add_reference :todo_lists, :user, index: true
    add_reference :todo_lists, :ticket, index: true
  end
end
