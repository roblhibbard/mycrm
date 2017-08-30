class AddZipCodeToLabClient < ActiveRecord::Migration[5.0]
  def change
    add_column :labtech_clients, :zip_code, :string
  end
end
