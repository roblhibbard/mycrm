class AddStatusIndexToTicket < ActiveRecord::Migration[5.0]
  def change
    add_reference :tickets, :status
  end
end
