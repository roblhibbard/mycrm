class AddPartonOrderDatePartsreceivedDateToParts < ActiveRecord::Migration[5.0]
  def change
    add_column :parts, :parts_ordered_date, :datetime
    add_column :parts, :parts_received_date, :datetime
  end
end
