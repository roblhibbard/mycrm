class ChangeForiengKeysToBigintMultiple19 < ActiveRecord::Migration[5.1]
  def change
    
    add_foreign_key "labtickets", "labtech_dispatches"
    
  end
end
