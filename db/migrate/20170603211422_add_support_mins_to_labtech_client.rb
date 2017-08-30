class AddSupportMinsToLabtechClient < ActiveRecord::Migration[5.0]
  def change
    add_column :labtech_clients, :support_mins, :integer
  end
end
