class CreateTimeslipCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :timeslip_categories do |t|
      t.string :name
      t.integer :labtime

      t.timestamps
    end
  end
end
