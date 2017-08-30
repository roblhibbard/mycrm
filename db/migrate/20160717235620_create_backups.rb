class CreateBackups < ActiveRecord::Migration[5.0]
  def change
    create_table :backups do |t|
      t.string :notes
      t.belongs_to :client, foreign_key: true
      t.date     "singup_date"
      t.date     "renewal_date"
      t.string   "notes"
      t.integer  "client_id"
      t.integer  "assigned_to_id"
      t.integer  "status_id"
      t.datetime "created_at",                                              null: false
      t.datetime "updated_at",                                              null: false
      t.integer  "it_service_id"
      t.decimal  "qty",            precision: 12, scale: 2, default: "0.0", null: false
      t.decimal  "price",          precision: 12, scale: 2, default: "0.0", null: false
      t.decimal  "total_price",    precision: 12, scale: 2, default: "0.0", null: false
      
      t.timestamps
    end
  end
end
