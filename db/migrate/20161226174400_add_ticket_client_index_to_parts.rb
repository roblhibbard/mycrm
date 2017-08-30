class AddTicketClientIndexToParts < ActiveRecord::Migration[5.0]
  def change
    add_reference :parts, :ticket, index: true
    add_reference :parts, :client, index: true
  end
end
