class AddTechToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :tech, :string
  end
end
