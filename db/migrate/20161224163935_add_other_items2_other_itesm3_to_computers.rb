class AddOtherItems2OtherItesm3ToComputers < ActiveRecord::Migration[5.0]
  def change
    add_column :computers, :other_items2, :text
    add_column :computers, :other_items3, :text
  end
end
