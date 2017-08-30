class CreateServiceCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :service_categories do |t|
      t.string :name
      t.integer :sub_category_id

      t.timestamps
    end
  end
end
