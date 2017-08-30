class ChangeTicketTitleToTextFromString < ActiveRecord::Migration[5.0]
  def change
    change_column :tickets, :ticket_title, :text
  end
end
