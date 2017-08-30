class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.string :ticket_title
      t.string :issue
      t.string :priority
      t.text :description
      t.date :due_date
      t.string :tech
      t.belongs_to :client, foreign_key: true

      t.timestamps
    end
  end
end
