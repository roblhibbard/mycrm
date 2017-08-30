class AddItemToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :labtech_id, :integer
  end
end
