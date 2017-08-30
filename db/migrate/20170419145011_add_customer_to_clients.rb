class AddCustomerToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :customer, :string
    add_column :clients, :active, :boolean
  end
end
