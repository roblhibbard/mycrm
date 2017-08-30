class Priority < ApplicationRecord
  has_many :tickets
  belongs_to :priority
  #belongs_to :priortable, polymorphic: true
end
