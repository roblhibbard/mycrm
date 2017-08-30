class RenameColumnLabtechLocationsToLabtechlocInLabtickets < ActiveRecord::Migration[5.0]
  def change
    rename_column :labtickets, :labtech_location, :labtechloc
    rename_column :labtickets, :labtech_computer, :labtechpc
  end
end
