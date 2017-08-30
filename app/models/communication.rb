class Communication < ApplicationRecord
 belongs_to :client
 has_many :b_tasks
 belongs_to :client
 belongs_to :backup
 
 
end
