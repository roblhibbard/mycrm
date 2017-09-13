class LabtechTimeslip < ApplicationRecord
  require 'httparty'
  require 'labtech'
  
  before_save :token, :timeslip
  after_save :travel_time
  
  has_many :labtickets
  belongs_to :labtech_client
  belongs_to :user
  belongs_to :lab_ticket_status
  belongs_to :timeslip_category
  has_and_belongs_to_many :labtech_timeslips
  
  def token
   @token = HTTParty.post('http://labtech.core-pc.com/WCC2/API/APIToken', 
   :headers => { 'Content-Type' => 'application/json'},
   :body => "\n{\n  \"password\" : \"Chang3m3\",\n  \"username\" : \"robert\"\n}")
  
  
   end
  
   def timeslip
      @labuser = self.user_id
      @labclient =self.labtech_client_id
      @start = self.started_date
      @ticketid = self.lab_ticketid
      @hours = self.hours
      @mins = self.mins
      @category = self.labtime
      @subject = self.subject
      
     
      @response = HTTParty.post('http://labtech.core-pc.com/WCC2/API/TimeSlips/',
      :headers => {'Content-Type' => 'application/json', "Authorization" => "LTToken  #{@token}",
                 "User-Agent" => "robert" },
       :body => {
        "TimeSlipID": '0',
        "UserID": @labuser,
        "ClientID": @labclient,
        "ProjectID": '0',
        "TicketID": @ticketid,
        "Hours": @hours,
        "Mins": @mins,
        "Done": 'false',
        "Date": @start,
        "Description": @subject,
        "Billed": '0',
        "CategoryID": @category 
       }.to_json )
       puts @response.body
    end   
    
    def travel_time   
       if self.labtime == "5"
      @response1 = HTTParty.post('http://labtech.core-pc.com/WCC2/API/TimeSlips/',
       :headers => {'Content-Type' => 'application/json', "Authorization" => "LTToken  #{@token}",
                 "User-Agent" => "robert" },
       :body => {
        "TimeSlipID": '0',
        "UserID": @labuser,
        "ClientID": @labclient,
        "ProjectID": '0',
        "TicketID": @ticketid,
        "Hours": '0',
        "Mins": '15',
        "Done": 'false',
        "Date": @start - (15*60),
        "Description": 'Travel Time',
        "Billed": '0',
        "CategoryID": '9' 
       }.to_json )
       puts @response1.body
       else
         travel_times = ""
       end
      
   end
end