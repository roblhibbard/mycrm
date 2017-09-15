class LabtechDispatch < ApplicationRecord
  #self.primary_key = "labtech_dispatch_id"
  has_many :labtickets, dependent: :destroy
  belongs_to :timeslip_category
  accepts_nested_attributes_for :labtickets,  reject_if: proc { |attributes| attributes['subject'].blank? }, allow_destroy: true
  
end
