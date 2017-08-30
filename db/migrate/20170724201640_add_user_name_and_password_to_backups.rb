class AddUserNameAndPasswordToBackups < ActiveRecord::Migration[5.0]
def change
    create_table :lab_ticket_statuses do |t|
      t.string :name
      t.integer :lab_status

      t.timestamps
    end
  end
end