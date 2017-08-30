class CreateTaskOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :task_options do |t|
      t.string :option

      t.timestamps
    end
  end
end
