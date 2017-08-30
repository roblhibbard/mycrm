class AddNameToLabtechClient < ActiveRecord::Migration[5.0]
  def change
    add_column :labtech_clients, :name, :string
  end
end
