class AddLocationIndexToTickets < ActiveRecord::Migration[5.0]
  def change
    add_reference :tickets, :location, index: true
  end
end
