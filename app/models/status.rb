class Status < ApplicationRecord
 has_many :b_tasks
 belongs_to :backup
 has_many :tickets
end
