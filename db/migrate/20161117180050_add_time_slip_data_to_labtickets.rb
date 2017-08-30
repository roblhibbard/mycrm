class AddTimeSlipDataToLabtickets < ActiveRecord::Migration[5.0]
  def change
    add_column :labtickets, :hours, :int
    add_column :labtickets, :mins, :int
    add_column :labtickets, :category, :int
  end
end
