class ChangeForiengKeysToBigintMultiple11 < ActiveRecord::Migration[5.1]
  def change
    
   change_column :labtech_times, :labticket_id, :bigint
   
    
   
  end
end
