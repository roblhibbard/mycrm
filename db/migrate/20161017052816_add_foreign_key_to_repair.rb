class AddForeignKeyToRepair < ActiveRecord::Migration[5.0]
  def change
    add_reference :repairs, :repair_category
  end
end
