class ContractServiceLine < ApplicationRecord
  belongs_to :contract_service
  belongs_to :service_list
  belongs_to :client
  
 
  before_create :calculate
  before_update :calculate
  
 
  
 def calculate
      srv = ServiceList.find(service_list_id)
      
      self.tax_rate = 0 
      
      self.price = srv.charge # Now the Item(s) Price from the service_list Column
      self.sub_total = srv.charge * self.qty #Now calculate the Charge * Line Qty
      self.tax = 0
      self.total_price = self.sub_total # Now Calculate the Subtotal
  
  end
end
