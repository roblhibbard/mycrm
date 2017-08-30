class AntiVirus < ApplicationRecord
  belongs_to :client
  belongs_to :computer
  belongs_to :service_type
  belongs_to :service_list
end
