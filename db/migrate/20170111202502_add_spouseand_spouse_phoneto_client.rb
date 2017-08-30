class AddSpouseandSpousePhonetoClient < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :spouse_name, :string
    add_column :clients, :spouse_phone, :string
  end
end
