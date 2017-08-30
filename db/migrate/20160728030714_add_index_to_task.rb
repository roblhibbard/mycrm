class AddIndexToTask < ActiveRecord::Migration[5.0]
  def change
    add_reference :tasks, :client
  end
end
