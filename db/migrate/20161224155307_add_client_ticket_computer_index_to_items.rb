class AddClientTicketComputerIndexToItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :client, index: true
    add_reference :items, :ticket, index: true
    add_reference :items, :computer, index: true
  end
end
