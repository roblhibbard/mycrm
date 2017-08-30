class AddNametoServiceLists < ActiveRecord::Migration[5.0]
  def change
    add_column :service_lists, :name, :string
  end
end
