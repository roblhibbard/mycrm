class AddIndexClientToDispatch < ActiveRecord::Migration[5.0]
  def change
    add_reference :dispatches, :client
  end
end
