class ChangeAccountBackups < ActiveRecord::Migration[5.0]
  def change
    remove_column :account_backups, :service_id, :integer
    add_column :account_backups, :it_service_id, :integer
    add_column :account_backups, :qty, :decimal, precision: 12, scale: 2, default: 0.0, null: false
    add_column :account_backups, :price, :decimal, precision: 12, scale: 2, default: 0.0, null: false
    add_column :account_backups, :total_price, :decimal, precision: 12, scale: 2, default: 0.0, null: false 
  end
end
