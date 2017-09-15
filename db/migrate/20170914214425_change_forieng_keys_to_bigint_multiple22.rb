class ChangeForiengKeysToBigintMultiple22 < ActiveRecord::Migration[5.1]
  def change
    
    add_reference :labtickets, :timeslip_category, foreign_key: true
    
  end
end
