class AddUserIdToContractService < ActiveRecord::Migration[5.0]
  def change
    add_reference :contract_services, :user, foreign_key: true
  end
end
