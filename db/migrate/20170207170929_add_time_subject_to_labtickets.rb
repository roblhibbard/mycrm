class AddTimeSubjectToLabtickets < ActiveRecord::Migration[5.0]
  def change
    add_column :labtickets, :time_subject, :text
  end
end
