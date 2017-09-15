class ChangeForiengKeysToBigintMultiple13 < ActiveRecord::Migration[5.1]
  def change
    
    change_column :labtech_timeslips, :user_id, :bigint
    
    
  end
end
