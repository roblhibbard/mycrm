class AddUserIdToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :user_id, :integer
    add_column :tickets, :client_id, :integer
  end
end
