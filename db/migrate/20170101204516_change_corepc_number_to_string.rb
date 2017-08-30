class ChangeCorepcNumberToString < ActiveRecord::Migration[5.0]
  def change
    change_column :computers, :corepc_number, :string
  end
end
