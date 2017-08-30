class ChangeSystemComputerIdToString < ActiveRecord::Migration[5.0]
  def change
    change_column :systems, :computer_id, :string
  end
end
