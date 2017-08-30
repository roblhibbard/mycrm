class AddComputerIdToAssets < ActiveRecord::Migration[5.0]
  def change
    #add_column :assets, :computer_id, :integer
    add_column :assets, :client_id, :integer, index: true
  end
end
