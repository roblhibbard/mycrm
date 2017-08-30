class Repair < ApplicationRecord
  belongs_to :ticket
  belongs_to :repair_category
  has_many :priorities
  has_many :malwares
  accepts_nested_attributes_for :malwares
end
