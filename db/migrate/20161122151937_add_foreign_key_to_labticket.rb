class AddForeignKeyToLabticket < ActiveRecord::Migration[5.0]
  def change
    add_reference :labtickets, :labtech_client
  end
end
