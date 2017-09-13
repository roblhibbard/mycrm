class LabtechDispatch < ApplicationRecord
  has_many :labtickets
  belongs_to :timeslip_category, optional: true
  accepts_nested_attributes_for :labtickets,  reject_if: proc { |attributes| attributes['subject'].blank? }, allow_destroy: true
  
end
