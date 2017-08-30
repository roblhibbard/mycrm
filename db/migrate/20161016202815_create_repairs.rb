class CreateRepairs < ActiveRecord::Migration[5.0]
  def change
    create_table :repairs do |t|
      t.decimal :percent_complete

      t.timestamps
    end
  end
end
