class CreateBTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :b_tasks do |t|
      t.references :backup, foreign_key: true
      t.string :backup_account
      t.text :details
      t.text :description
      t.string :status
      t.string :communication
      t.integer :status_id
      t.integer :communication_id

      t.timestamps
    end
  end
end
