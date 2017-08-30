class LabtechClient < ApplicationRecord
  self.primary_key = "lclient_id"

has_many :labtickets, :dependent => :destroy
has_many :labtech_timeslips, :dependent => :destroy
has_many :labtech_locations, :dependent => :destroy
has_many :labtech_computers, :dependent => :destroy
has_many :labtech_client_other_datum
has_many :labtech_times, :foreign_key => "timeslip_id", :class_name => "LabtechTime"
has_many :backup_pcs
#before_validation :token, :set_lclient_id
#before_save :token
#before_save :add_client
#after_save :token, :update_labclient
#before_create :token, :set_lclient_id
accepts_nested_attributes_for :labtech_times

scope :contracts, -> { where('labtech_clients.support_mins > 0')}
scope :non_contract, -> { where('labtech_clients.support_mins = 0 ')}
scope :no_hours, -> {where(id: :lclient_id)}
#where("NOT EXISTS (SELECT null FROM labtech_clients where labtech_times.id = ?)", nil) }
    
 validates :id, uniqueness: true
 
    def self.search(search)
      
        where('first_name LIKE ? OR name LIKE ? OR lclient_id LIKE ? OR company_name LIKE ? 
        OR first_name LIKE ? OR phone LIKE ? ', 
        "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
       
    end
    paginates_per 10
    
end

