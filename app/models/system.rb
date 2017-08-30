class System < ApplicationRecord
  belongs_to :client
  belongs_to :ticket
end
