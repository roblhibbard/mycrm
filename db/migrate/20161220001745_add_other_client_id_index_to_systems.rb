class AddOtherClientIdIndexToSystems < ActiveRecord::Migration[5.0]
  def change
    
     add_reference :systems, :other_clientid, index: true
     
  end
  
end
