class Part < ApplicationRecord
  belongs_to :client
  belongs_to :ticket
  
end
