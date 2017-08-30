class AddLabtechTimeToTimeCategories < ActiveRecord::Migration[5.0]
  def change
    add_reference :time_categories, :labtech_time, foreign_key: true
  end
end
