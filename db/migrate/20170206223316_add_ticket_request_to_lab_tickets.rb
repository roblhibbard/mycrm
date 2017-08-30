class AddTicketRequestToLabTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :labtickets, :lab_request, :text
  end
end
