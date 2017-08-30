class AddEmail2ToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :email2, :string
    add_column :clients, :notes, :text
  end
end
