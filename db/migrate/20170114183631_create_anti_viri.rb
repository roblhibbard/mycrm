class CreateAntiViri < ActiveRecord::Migration[5.0]
  def change
    create_table :anti_viri do |t|
      t.references :client, foreign_key: true
      t.string :rep
      t.string :username
      t.string :password
      t.integer :licence_number
      t.string :licence_key
      t.string :computer
      t.belongs_to :computer, foreign_key: true
      t.belongs_to :service_type, foreign_key: true
      t.belongs_to :service_list, foreign_key: true

      t.timestamps
    end
  end
end
