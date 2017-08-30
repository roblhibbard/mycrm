class AddMultiTaxableToTasks < ActiveRecord::Migration[5.0]
  def change
   
    add_column :tasks, :multitaskable_id, :integer
    add_column :tasks, :multitaskable_type, :string
    add_index :tasks, [:multitaskable_type, :multitaskable_id]
  end
end
