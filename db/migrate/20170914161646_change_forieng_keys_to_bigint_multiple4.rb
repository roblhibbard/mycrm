class ChangeForiengKeysToBigintMultiple4 < ActiveRecord::Migration[5.1]
  def change
    
    
    add_foreign_key "labtech_computers", "labtech_clients"
    
  end
end
