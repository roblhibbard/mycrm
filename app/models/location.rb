class Location < ApplicationRecord
  #has_many :tickets
  has_many :tickets, inverse_of: :location
  has_many :users
  has_many :clients
  
end
