class AddOperatingSystemToComputer < ActiveRecord::Migration[5.0]
  def change
    add_column :computers, :operating_system, :string
  end
end
