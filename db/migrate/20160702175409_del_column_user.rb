class DelColumnUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :tickets, :client_id, :integer
    remove_column :tickets, :user_id, :integer
  end
end
