class TimeslipCategory < ApplicationRecord
  has_many :labtech_timeslips
  has_many :labtech_dispatches
  has_many :labtickets
end
