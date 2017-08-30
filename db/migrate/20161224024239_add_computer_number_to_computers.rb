class AddComputerNumberToComputers < ActiveRecord::Migration[5.0]
  def change
    add_column :computers, :corepc_number, :integer
  end
end
