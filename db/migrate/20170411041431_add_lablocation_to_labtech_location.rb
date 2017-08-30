class AddLablocationToLabtechLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :labtech_locations, :lablocation_id, :integer
  end
end
