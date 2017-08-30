class AddCommunicationIndexToBackup < ActiveRecord::Migration[5.0]
  def change
    add_reference :communications, :backup
  end
end
