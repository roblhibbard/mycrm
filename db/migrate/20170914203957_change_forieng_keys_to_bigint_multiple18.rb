class ChangeForiengKeysToBigintMultiple18 < ActiveRecord::Migration[5.1]
  def change
    
    
   remove_foreign_key :labtickets, :labtech_dispatches
    
  end
end
