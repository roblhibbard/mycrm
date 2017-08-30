class AddOtherPartsToParts < ActiveRecord::Migration[5.0]
  def change
    add_column :parts, :part_one, :string
    add_column :parts, :part_two, :string
    add_column :parts, :part_three, :string
    add_column :parts, :part_four, :string
    add_column :parts, :part_five, :string
    add_column :parts, :part_cost_one, :decimal, precision: 5, scale: 2
    add_column :parts, :part_cost_two, :decimal, precision: 5, scale: 2
    add_column :parts, :part_cost_three, :decimal, precision: 5, scale: 2
    add_column :parts, :part_cost_four, :decimal, precision: 5, scale: 2
    add_column :parts, :part_cost_five, :decimal, precision: 5, scale: 2
  end
end
