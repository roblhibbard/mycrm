class AddOtherItemsToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :other_clientid, :integer
  end
end
