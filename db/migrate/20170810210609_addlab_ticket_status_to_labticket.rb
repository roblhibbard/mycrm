class AddlabTicketStatusToLabticket < ActiveRecord::Migration[5.1]
  def change
    add_reference :labtickets, :lab_ticket_status, index: true
  end
end
