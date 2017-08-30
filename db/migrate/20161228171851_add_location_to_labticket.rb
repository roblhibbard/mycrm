class AddLocationToLabticket < ActiveRecord::Migration[5.0]
  def change
    add_column :labtickets, :labtech_location, :integer
    add_column :labtickets, :labtech_computer, :integer
  end
end
