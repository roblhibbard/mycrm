class RenameTypeforComputer < ActiveRecord::Migration[5.0]
  def change
    rename_column :systems, :type, :system_type
  end
end
