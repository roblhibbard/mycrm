class AddClientRepairToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :client_repair, :integer
  end
end
