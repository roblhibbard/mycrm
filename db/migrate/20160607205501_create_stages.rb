class CreateStages < ActiveRecord::Migration[5.0]
  def change
    create_table :stages do |t|
      t.string :name
      t.string :string
      t.string :color
      t.string :string

      t.timestamps
    end
    add_column :tickets, :stage_id, :integer
    add_index :tickets, :stage_id
  end
end
