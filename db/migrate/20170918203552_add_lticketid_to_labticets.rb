class AddLticketidToLabticets < ActiveRecord::Migration[5.1]
  def change
    add_column :labtickets, :lticket_id, :integer
  end
end
