class CreateServiceTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :service_types do |t|
      t.string :name
      t.string :email_note1
      t.string :email_note2
      t.string :email_note3
      t.string :email_note4
      t.belongs_to :client, foreign_key: true

      t.timestamps
    end
  end
end
