class MakeIndexChangesToServiceLists < ActiveRecord::Migration[5.0]
  def change
    add_reference :service_lists, :client, index: true
  end
end
