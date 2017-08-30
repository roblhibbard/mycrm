class AddItemsToLabtechClient < ActiveRecord::Migration[5.0]
  def change
    
    
  
    add_column :labtech_clients, :address1, :string
    add_column :labtech_clients, :address2, :string
    add_column :labtech_clients, :city, :string
    add_column :labtech_clients, :state, :string
    add_column :labtech_clients, :phone, :string
  end
end
