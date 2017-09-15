class ChangeForeignKeysToBigint < ActiveRecord::Migration[5.1]
  def change
     
     change_column :labtickets, :labtech_location_id, :bigint
     change_column :labtickets, :labtech_computer_id, :bigint
     change_column :labtickets, :lab_ticket_status_id, :bigint
     change_column :labtickets, :labtech_client_id, :bigint
     change_column :labtickets, :labtech_timeslip_id, :bigint
     
  end
end
