class AddIndexesToLabticket < ActiveRecord::Migration[5.0]
  def change
    add_reference :labtickets, :labtech_location, index: true
    add_reference :labtickets, :labtech_computer, index: true
  end
end
