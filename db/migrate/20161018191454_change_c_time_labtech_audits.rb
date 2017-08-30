class ChangeCTimeLabtechAudits < ActiveRecord::Migration[5.0]
  def change
    change_column :labtech_audits, :cal_time, :decimal, precision: 5, scale: 2
    change_column :labtech_audits, :time_dif, :decimal, precision: 5, scale: 2
  end
end
