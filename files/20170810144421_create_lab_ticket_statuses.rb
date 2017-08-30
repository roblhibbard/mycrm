class CreateLabTicketStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :lab_ticket_statuses do |t|
      t.string :name
      t.belongs_to :labticket, foreign_key: true

      t.timestamps
    end
  end
end
