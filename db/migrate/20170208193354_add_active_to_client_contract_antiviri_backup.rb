class AddActiveToClientContractAntiviriBackup < ActiveRecord::Migration[5.0]
  def change
    
    
    add_column :anti_viri, :active, :boolean
    add_column :computers, :active, :boolean
  end
end
