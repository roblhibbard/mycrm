class MakeChangesToTicketsAndSystems < ActiveRecord::Migration[5.0]
  def change
   remove_reference :tickets, :system, foreign_key: true
  end
end
