class AddComputerIdFromSystemsToTickets < ActiveRecord::Migration[5.0]
  def change
    add_reference :systems, :ticket, index: true
  end
end
