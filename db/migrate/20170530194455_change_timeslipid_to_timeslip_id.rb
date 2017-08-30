class ChangeTimeslipidToTimeslipId < ActiveRecord::Migration[5.0]
  def change
    rename_column :labtech_times, :timeslipid, :timeslip_id
  end
end
