class AddIndexToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :dispatches, :user
  end
end
