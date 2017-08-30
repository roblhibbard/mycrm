class CreateJoinTableOwnerClient < ActiveRecord::Migration[5.0]
  def change
    create_join_table :owners, :clients do |t|
      # t.index [:owner_id, :client_id]
      # t.index [:client_id, :owner_id]
    end
  end
end
