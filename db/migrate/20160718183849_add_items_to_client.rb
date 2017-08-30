class AddItemsToClient < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :company, :string
    add_column :clients, :primary_contact, :string
    add_column :clients, :fax, :integer
    add_column :clients, :cell, :integer
    add_column :clients, :secondary_contact, :string
    add_column :clients, :backup_account, :string
    add_column :clients, :city, :string
  end
end
