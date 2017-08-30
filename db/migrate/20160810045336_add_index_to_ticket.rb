class AddIndexToTicket < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :client_full_name, :string
    add_column :tickets, :issue_id, :integer
    add_column :tickets, :priority_id, :integer
    add_column :tickets, :issue_name, :string
    add_column :tickets, :priority_name, :string
  end
end
