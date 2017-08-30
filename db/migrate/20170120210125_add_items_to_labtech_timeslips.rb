class AddItemsToLabtechTimeslips < ActiveRecord::Migration[5.0]
  def change
    add_column :labtech_timeslips, :user_id, :integer
    add_column :labtech_timeslips, :started_date, :datetime
    add_column :labtech_timeslips, :mins, :integer
    add_column :labtech_timeslips, :hours, :integer
    add_column :labtech_timeslips, :subject, :text
    add_column :labtech_timeslips, :lab_clientid, :integer
    add_column :labtech_timeslips, :lab_ticketid, :integer
    change_column :labtech_timeslips, :labtime, :string
    add_reference :labtech_timeslips, :labtech_client, index: true
  end
end
