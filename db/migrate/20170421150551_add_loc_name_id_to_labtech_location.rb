class AddLocNameIdToLabtechLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :labtech_locations, :loc_name_id, :string
  end
end
