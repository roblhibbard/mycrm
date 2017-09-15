class ChangeForiengKeysToBigintMultiple16 < ActiveRecord::Migration[5.1]
  def change
    
    change_column :timeslip_categories, :id, :bigint
    
  end
end
