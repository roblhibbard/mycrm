class Item < ApplicationRecord
  belongs_to :client
  belongs_to :ticket
  belongs_to :computer
end
