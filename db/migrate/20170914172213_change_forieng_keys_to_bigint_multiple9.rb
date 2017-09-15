class ChangeForiengKeysToBigintMultiple9 < ActiveRecord::Migration[5.1]
  def change
    
    
    
    change_column :labtech_client_other_data, :labtech_client_id, :bigint
    
    
  end
end
