class CreateRails < ActiveRecord::Migration[5.0]
  def change
    create_table :rails do |t|
      t.string :name

      t.timestamps
    end
  end
end
