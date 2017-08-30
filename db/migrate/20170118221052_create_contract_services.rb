class CreateContractServices < ActiveRecord::Migration[5.0]
  def change
    create_table :contract_services do |t|
      t.string :rep
      t.string :username
      t.string :rim_password
      t.integer :licence_number
      t.string :licence_key
      t.date   :contact_date1 
      t.date   :contact_date2
      t.date    :contact_date3
      t.boolean :contact_done1
      t.boolean :contact_done2
      t.boolean :contact_done3
      t.date    :service_date
      t.date    :next_service_date
      t.text    :notes
      t.string  :rim_computer
      t.integer :rim_service
      t.string  :rim_contact
      t.string  :rim_email
      t.string  :rim_phone
      t.integer :rim_charge
      t.integer :rim_client
      t.belongs_to :client, foreign_key: true
      t.belongs_to :computer, foreign_key: true
      t.belongs_to :service_list, foreign_key: true
      t.belongs_to :service_type, foreign_key: true
      

      t.timestamps
    end
  end
end
