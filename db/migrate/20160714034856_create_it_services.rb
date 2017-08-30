class CreateItServices < ActiveRecord::Migration[5.0]
  def change
    create_table :it_services do |t|
      t.string :name
      t.string :description
      t.decimal :rate
      t.boolean :active

      t.timestamps
    end
  end
end
