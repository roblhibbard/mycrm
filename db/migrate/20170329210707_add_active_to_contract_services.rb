class AddActiveToContractServices < ActiveRecord::Migration[5.0]
  def change
    add_column :contract_services, :active, :boolean
  end
end
