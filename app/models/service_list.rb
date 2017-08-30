class ServiceList < ApplicationRecord
  belongs_to :service_type
  belongs_to :client
  has_many :backups
  belongs_to :contract_service, inverse_of: :service_lists
  has_many :contract_service_lines, :dependent => :destroy
  has_many :backup_pcs
  
  accepts_nested_attributes_for :contract_service_lines,  reject_if: proc { |attributes| attributes['qty'].blank? }, :allow_destroy => true
 
 #validates_presence_of :name
 def charge_lookup
    "#{I18n.t 'number.currency.format.unit'}#{charge}"
 end
 
end
