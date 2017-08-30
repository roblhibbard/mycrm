class AddMoreToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :expected_date, :date
    add_column :tickets, :received_date, :date
    
    add_column :tickets, :completed_date, :date
    add_column :tickets, :invoiced_date, :date
    add_column :tickets, :follow_up_call, :boolean
    add_column :tickets, :pickup_date, :date
    add_column :tickets, :pickup, :boolean
  end
end
