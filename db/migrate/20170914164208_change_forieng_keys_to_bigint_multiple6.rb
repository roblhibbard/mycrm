class ChangeForiengKeysToBigintMultiple6 < ActiveRecord::Migration[5.1]
  def change
    
  change_column :labtech_locations, :labtech_client_id, :bigint
    
    
  end
end
