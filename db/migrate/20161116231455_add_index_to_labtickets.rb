class AddIndexToLabtickets < ActiveRecord::Migration[5.0]
  def change
    add_reference :labtickets, :labtech_client, index: true
  end
end
