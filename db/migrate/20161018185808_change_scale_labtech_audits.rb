class ChangeScaleLabtechAudits < ActiveRecord::Migration[5.0]
  def change
    change_column :labtech_audits, :time, :decimal, precision: 5, scale: 2
  end
end
