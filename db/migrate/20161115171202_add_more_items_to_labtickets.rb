class AddMoreItemsToLabtickets < ActiveRecord::Migration[5.0]
  def change
    
    remove_column :labtickets, :project_id, :integerrai
  end
end
