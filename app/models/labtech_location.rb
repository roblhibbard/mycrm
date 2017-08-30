class LabtechLocation < ApplicationRecord
  self.primary_key = "lablocation_id"
  belongs_to :labtech_client
  
  has_many :labtech_computers
  has_many :labtech_tickets

  accepts_nested_attributes_for :labtech_computers, allow_destroy: true
  
  
end
