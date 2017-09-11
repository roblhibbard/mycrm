class LabTicketStatus < ApplicationRecord
  has_many :labtickets
  has_many :labtech_timeslips
end
