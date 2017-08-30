class RemoveReferenceFromClient < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :clients, column: :rim_client
  end
end
