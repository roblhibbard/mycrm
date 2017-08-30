class AddContactDate1And2And3ToAntiVirus < ActiveRecord::Migration[5.0]
  def change
    add_column :anti_viri, :contact_date1, :date
    add_column :anti_viri, :contact_date2, :date
    add_column :anti_viri, :contact_date3, :date
    add_column :anti_viri, :contact_done1, :boolean
    add_column :anti_viri, :contact_done2, :boolean
    add_column :anti_viri, :contact_done3, :boolean
    
    add_column :anti_viri, :rim_service, :integer
    add_column :anti_viri, :rim_contact, :string
    add_column :anti_viri, :rim_email, :string
    add_column :anti_viri, :rim_phone, :string
  end
end
