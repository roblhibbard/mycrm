class AddLabtechComputerRefToComputers < ActiveRecord::Migration[5.0]
  def change
    add_reference :computers, :labtech_computer, foreign_key: true
  end
end
