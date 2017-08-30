class AddSubtotalTaxTotalToContractServices < ActiveRecord::Migration[5.0]
  def change
    add_column :contract_services, :sub_total, :decimal, default: 0.0, precision: 12, scale: 2
    add_column :contract_services, :tax_total, :decimal, default: 0.0, precision: 12, scale: 2
    add_column :contract_services, :total, :decimal, default: 0.0, precision: 12, scale: 2
  end
end
