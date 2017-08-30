class AddServiceDateNextServiceDateNoteToAntiVirus < ActiveRecord::Migration[5.0]
  def change
    add_column :anti_viri, :service_date, :datetime
    add_column :anti_viri, :next_service_date, :datetime
    add_column :anti_viri, :note, :text
  end
end
