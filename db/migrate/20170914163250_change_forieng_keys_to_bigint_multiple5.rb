class ChangeForiengKeysToBigintMultiple5 < ActiveRecord::Migration[5.1]
  def change
    
    
    
    change_column :labtech_computers, :labtech_location_id, :bigint
    
    add_foreign_key "labtech_computers", "labtech_locations"
  end
end
