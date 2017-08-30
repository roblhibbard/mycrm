class AddFixNotesInvoiceNotes < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :fix_notes, :text
    add_column :tickets, :invoice_notes, :text
  end
end
