class AddForeignKeyRimClientToBackups < ActiveRecord::Migration[5.0]
  def change
    add_column :backups, :rim_client, :integer
  end
end
