class TestMIgrations < ActiveRecord::Migration[5.0]
  def change
  drop_table :service_categories  
  end
end
