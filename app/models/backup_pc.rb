class BackupPc < ApplicationRecord
  
  belongs_to :backup
  belongs_to :labtech_client
  belongs_to :labtech_computer, :foreign_key => "computerid", :class_name => "LabtechComputer"
  belongs_to :service_list
  belongs_to :client
  belongs_to :computer
end
