class CreateParts < ActiveRecord::Migration[5.0]
  def change
    create_table :parts do |t|
      t.string :name
      t.text :description
      t.decimal :cost
      t.decimal :price
      t.boolean :parts_on_order
      t.boolean :parts_in
      t.datetime :date_ordered
      t.datetime :date_received

      t.timestamps
    end
  end
end
