class ChangeForiengKeysToBigintMultiple20 < ActiveRecord::Migration[5.1]
  def change
    
    remove_foreign_key "labtickets", "timeslip_categories"
    
  end
end
