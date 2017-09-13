class AddReferenceToTimeslipCategory < ActiveRecord::Migration[5.1]
  def change
    add_reference :labtech_timeslips, :timeslip_category, foreign_key: true
  end
end
