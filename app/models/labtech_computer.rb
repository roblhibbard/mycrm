class LabtechComputer < ApplicationRecord
    self.primary_key = "computerid"
  belongs_to :labtech_client
  belongs_to :labtech_location
  belongs_to :backup
  has_many :labtickets
  has_many :backup_pcs, dependent: :destroy
  has_many :labtech_times, :foreign_key => "timeslip_id", :class_name => "LabtechTime"
  has_many :computers
end
