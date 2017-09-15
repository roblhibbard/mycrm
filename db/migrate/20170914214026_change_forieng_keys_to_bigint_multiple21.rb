class ChangeForiengKeysToBigintMultiple21 < ActiveRecord::Migration[5.1]
  def change
    
   remove_column :labtickets, :timeslip_category_id
    
  end
end
