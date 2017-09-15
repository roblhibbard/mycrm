class ChangeForiengKeysToBigintMultiple12 < ActiveRecord::Migration[5.1]
  def change
    
    change_column :labtickets, :user_id, :bigint
    
  end
end
