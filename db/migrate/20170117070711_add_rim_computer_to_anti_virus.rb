class AddRimComputerToAntiVirus < ActiveRecord::Migration[5.0]
  def change
    add_column :anti_viri, :rim_computer, :string
  end
end
