class ServiceType < ApplicationRecord
  belongs_to :client
  has_many :backups
  has_many :contract_services
end
