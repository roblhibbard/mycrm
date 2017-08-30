class ChangeComputerToIntegerOnTickets < ActiveRecord::Migration[5.0]
  def change
    change_column :systems, :computer, :integer
  end
end
