class AddPercentCompleteToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :percent_complete, :decimal
  end
end
