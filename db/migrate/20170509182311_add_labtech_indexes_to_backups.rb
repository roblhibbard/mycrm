class AddLabtechIndexesToBackups < ActiveRecord::Migration[5.0]
  def change
    add_reference :labtech_computers, :backup, index: true
    add_reference :labtech_locations, :backup, index: true
    
  end
end
