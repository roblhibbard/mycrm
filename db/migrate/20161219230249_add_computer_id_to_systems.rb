class AddComputerIdToSystems < ActiveRecord::Migration[5.0]
  def change
    add_column :systems, :type, :string
  end
end
