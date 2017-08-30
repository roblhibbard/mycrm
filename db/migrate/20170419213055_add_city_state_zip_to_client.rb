class AddCityStateZipToClient < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :city_state_zip, :string
  end
end
