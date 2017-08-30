class CreateCommunications < ActiveRecord::Migration[5.0]
  def change
    create_table :communications do |t|
      t.string :name
      t.string :client_id

      t.timestamps
    end
    add_index :communications, :client_id
  end
end
