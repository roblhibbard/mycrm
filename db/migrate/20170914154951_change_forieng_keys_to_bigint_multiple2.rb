class ChangeForiengKeysToBigintMultiple2 < ActiveRecord::Migration[5.1]
  def change
    
    
     change_column :labtech_computers, :id, :bigint
     
      add_foreign_key "labtech_computers", "labtech_computers"
     
     
  end
end
