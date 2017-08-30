class AddDoneToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :todo_lists, :complete, :boolean
  end
end
