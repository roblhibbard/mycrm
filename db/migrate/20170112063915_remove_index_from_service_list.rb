class RemoveIndexFromServiceList < ActiveRecord::Migration[5.0]
  def change
    remove_reference :service_types, :service_list
    add_reference :service_lists, :service_type
  end
end
