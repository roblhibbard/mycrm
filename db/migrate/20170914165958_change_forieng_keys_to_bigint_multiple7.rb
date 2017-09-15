class ChangeForiengKeysToBigintMultiple7 < ActiveRecord::Migration[5.1]
  def change
    change_column :labtech_times, :labtech_client_id, :bigint
    change_column :labtech_timeslips, :labtech_client_id, :bigint
    change_column :backup_pcs, :labtech_client_id, :bigint
    
    
  end
end
