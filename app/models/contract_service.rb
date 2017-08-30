class ContractService < ApplicationRecord
  
  has_many :contract_service_lines, dependent: :destroy
  belongs_to :client
  belongs_to :service_list
  belongs_to :service_type
  belongs_to :user
  
  validates_presence_of :client_id
  scope :active, -> { where(active: '1' )}
  scope :not_active, -> { where(active: '0' )}
  
  accepts_nested_attributes_for :contract_service_lines,  reject_if: proc { |attributes| attributes['line_comment'].blank? }, allow_destroy: true
  
  before_save :update_contract_service_values
  after_save :update_contract_service_values
  before_update :update_contract_service_values
  after_update :update_contract_service_values
  after_initialize :update_contract_service_values

  
# Service lines totals
 
 def contract_price_totals
    contract_service_lines.to_a.sum(&:total_price)
  end

  def contract_tax_totals
    contract_service_lines.to_a.sum(&:tax)
  end

  def contract_sub_totals
    contract_service_lines.to_a.sum(&:sub_total)
  end
 

  # Used to update contract_service Totals on Save/Update
  def update_contract_service_values
    self.sub_total = contract_sub_totals
    self.tax_total = contract_tax_totals
    self.total = contract_price_totals    
    #self.rep = :user_first_name
  end
  def update_active_status
    self.active = true
  end
  
  
  paginates_per 10
end