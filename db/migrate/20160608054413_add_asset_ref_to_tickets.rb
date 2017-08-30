class AddAssetRefToTickets < ActiveRecord::Migration[5.0]
  def up
    remove_reference :tickets, :client, index: true 
  end
  
  def down
    add_reference :tickets, :client, index:true
  end
end
