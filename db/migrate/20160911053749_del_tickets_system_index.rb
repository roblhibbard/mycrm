class DelTicketsSystemIndex < ActiveRecord::Migration[5.0]
  def change
    remove_reference :tickets, :system
  end
end
