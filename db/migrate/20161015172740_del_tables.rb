class DelTables < ActiveRecord::Migration[5.0]
  def change
    drop_table :malwares
    drop_table :repairs
  end
end
