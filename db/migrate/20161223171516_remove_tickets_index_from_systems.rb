class RemoveTicketsIndexFromSystems < ActiveRecord::Migration[5.0]
  def change
    remove_reference :systems, :ticket
  end
end
