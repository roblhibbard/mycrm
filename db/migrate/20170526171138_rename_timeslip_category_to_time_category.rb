class RenameTimeslipCategoryToTimeCategory < ActiveRecord::Migration[5.0]
  def change
    rename_table :timeslip_categories, :time_categories
  end
end
