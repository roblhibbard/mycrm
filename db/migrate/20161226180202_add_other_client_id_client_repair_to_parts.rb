class AddOtherClientIdClientRepairToParts < ActiveRecord::Migration[5.0]
  def change
    add_column :parts, :client_repair, :integer
    add_column :parts, :other_clientid, :integer
  end
end
