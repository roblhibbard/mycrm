class AddIndexSystemToTickets < ActiveRecord::Migration[5.0]
  def change
    add_reference :systems, :ticket
  end
end
