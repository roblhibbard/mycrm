class AddRimIdToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :rim_client, :integer
    add_column :clients, :address2, :string
  end
end
