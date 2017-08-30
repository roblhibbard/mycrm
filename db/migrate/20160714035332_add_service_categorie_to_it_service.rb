class AddServiceCategorieToItService < ActiveRecord::Migration[5.0]
  def change
    add_column :it_services, :service_categories_id, :integer, index: true
  end
end
