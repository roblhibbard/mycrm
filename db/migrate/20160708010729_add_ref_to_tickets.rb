class AddRefToTickets < ActiveRecord::Migration[5.0]
  def change
   add_column :backup_maintenances, :backup_id, index: true
 end
end
