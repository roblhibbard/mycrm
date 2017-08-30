class AddRimItemsToBackups < ActiveRecord::Migration[5.0]
  def change
    add_column :backups, :service_date, :datetime
    add_column :backups, :next_service_date, :datetime
    add_column :backups, :contact_date1, :date
    add_column :backups, :contact_date2, :date
    add_column :backups, :contact_date3, :date
    add_column :backups, :contact_done1, :boolean
    add_column :backups, :contact_done2, :boolean
    add_column :backups, :contact_done3, :boolean
    add_column :backups, :rim_computer, :string
    add_column :backups, :rim_service, :integer
    add_column :backups, :rim_contact, :string
    add_column :backups, :rim_email, :string
    add_column :backups, :rim_phone, :string
    add_reference :backups, :service_list
    add_reference :backups, :service_type
    add_reference :backups, :computer
    
  end
end
