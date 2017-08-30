class LabtechTime < ApplicationRecord
 self.primary_key = "timeslip_id"
  
  belongs_to :user
  belongs_to :labticket
  belongs_to :labtech_client, :foreign_key => "lclient_id", :class_name => "LabtechClient"
#  before_create :company_name
 # after_create :total_hours
 
 scope :no_hours, -> {where("NOT EXISTS (SELECT null FROM labtech_times where labtech_times.timeslip_id = ?)", nil) }
   
  def total_hours
    LabtechTime.group(:lclient_id).sum(:hours)
  end
  
  validates :timeslip_id, uniqueness: true
  
  
  paginates_per 8
  
end
