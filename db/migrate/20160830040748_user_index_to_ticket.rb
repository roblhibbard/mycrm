class UserIndexToTicket < ActiveRecord::Migration[5.0]
  def change
    add_reference :tickets, :user
  end
end
