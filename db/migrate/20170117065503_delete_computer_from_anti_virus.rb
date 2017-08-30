class DeleteComputerFromAntiVirus < ActiveRecord::Migration[5.0]
  def change
    remove_column :anti_viri, :computer
  end
end
