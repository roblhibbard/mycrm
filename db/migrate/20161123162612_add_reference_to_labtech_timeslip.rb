class AddReferenceToLabtechTimeslip < ActiveRecord::Migration[5.0]
  def change
    add_reference :labtickets, :labtech_timeslip, index: true
  end
end
