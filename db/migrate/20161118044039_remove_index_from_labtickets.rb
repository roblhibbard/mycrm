class RemoveIndexFromLabtickets < ActiveRecord::Migration[5.0]
  def change
     remove_reference :labtickets, :labtech_client
  end
end
