class AddColumnsToBackups < ActiveRecord::Migration[5.0]
  def change
    add_column :backups, :user_login, :string
    add_column :backups, :user_pass, :string
  end
end
