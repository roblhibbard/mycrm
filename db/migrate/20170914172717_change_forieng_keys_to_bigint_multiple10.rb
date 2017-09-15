class ChangeForiengKeysToBigintMultiple10 < ActiveRecord::Migration[5.1]
  def change
    
  change_column :labtech_clients, :id, :bigint  
  end
end
