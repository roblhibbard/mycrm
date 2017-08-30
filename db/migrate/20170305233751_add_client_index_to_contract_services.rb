class AddClientIndexToContractServices < ActiveRecord::Migration[5.0]
  def change
    add_reference :contract_service_lines, :client, foreign_key: true
  end
end
