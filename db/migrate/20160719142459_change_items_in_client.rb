class ChangeItemsInClient < ActiveRecord::Migration[5.0]
  def change
   change_column :clients, :fax, :string
   change_column :clients, :cell, :string
   change_column :clients, :phone_number, :string
  end
end
