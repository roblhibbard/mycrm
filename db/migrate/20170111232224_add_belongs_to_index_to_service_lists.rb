class AddBelongsToIndexToServiceLists < ActiveRecord::Migration[5.0]
  def change
    add_reference :service_types, :service_list
  end
end
