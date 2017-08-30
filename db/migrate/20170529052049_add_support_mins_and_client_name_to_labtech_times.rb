class AddSupportMinsAndClientNameToLabtechTimes < ActiveRecord::Migration[5.0]
  def change
    add_column :labtech_times, :support_mins, :integer
    add_column :labtech_times, :client_name, :string
  end
end
