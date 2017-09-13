class AddReferenceToLabtechDispatches < ActiveRecord::Migration[5.1]
  def change
    add_reference :labtickets, :labtech_dispatch, foreign_key: true
  end
end
