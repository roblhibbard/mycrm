class ChangePasswordToRimPasswordAntiVirus < ActiveRecord::Migration[5.0]
  def change
    rename_column :anti_viri, :password, :rim_password
  end
end
