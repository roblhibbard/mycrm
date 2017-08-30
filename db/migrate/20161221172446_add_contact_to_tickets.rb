class AddContactToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :contact, :string
  end
end
