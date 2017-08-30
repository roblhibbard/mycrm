class AddIndexToSystem < ActiveRecord::Migration[5.0]
  def change
    add_reference :tickets, :system
  end
end
