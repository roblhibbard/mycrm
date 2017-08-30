class AddClientNameToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :client_first_name, :string, index: true
    add_column :tickets, :client_last_name, :string, index: true
  end
end
