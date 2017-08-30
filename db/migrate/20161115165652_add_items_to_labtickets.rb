class AddItemsToLabtickets < ActiveRecord::Migration[5.0]
  def change
    add_column :labtickets, :client_id, :integer
    add_column :labtickets, :project_id, :integer
    add_column :labtickets, :status_id, :integer
    add_column :labtickets, :user_id, :integer
    add_column :labtickets, :started_date, :datetime
  end
end
