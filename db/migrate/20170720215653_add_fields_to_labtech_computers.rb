class AddFieldsToLabtechComputers < ActiveRecord::Migration[5.0]
  def change
    add_column :labtech_computers, :company, :string
    add_column :labtech_computers, :clientid, :integer
    add_column :labtech_computers, :locationid, :integer
    add_column :labtech_computers, :computerid, :integer
    add_column :labtech_computers, :lastcontact, :datetime
  end
end
