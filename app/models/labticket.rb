class Labticket < ApplicationRecord
 require 'httparty'

 require 'labtech'
 before_save :token, :ticket
 after_save :travel_time
 #after_create :create_ticket
 
  belongs_to :labtech_client
  belongs_to :user
  belongs_to :labtech_timeslip
  belongs_to :labtech_location
  belongs_to :labtech_computer
  belongs_to :lab_ticket_status
  has_many   :labtech_times
 
  #belongs_to :client
  
  def token
   @token = HTTParty.post('http://labtech.core-pc.com/WCC2/API/APIToken', 
   :headers => { 'Content-Type' => 'application/json'},
   :body => "\n{\n  \"password\" : \"Chang3m3\",\n  \"username\" : \"robert\"\n}")
  
  
   end
  
  def self.to_pdf
    WickedPdf.new.pdf_from_string(to_html)
  end
   def self.get_tickets
  
  end
  
  def ticket
  
  @labclient = self.labtech_client_id
  @subject = self.subject
  @request = self.lab_request
  @labuser = self.user_id
  @status = self.lab_ticket_status_id
  @start = self.started_date
  @labrequest = self.requestor_email
  @hours = self.hours
  @mins = self.mins
  @category = self.labtech_timeslip_id
  @lablocation = self.labtechloc
  @labcomputer = self.labtechpc
  @time_subject = self.time_subject
  
      
   @response = HTTParty.post('http://labtech.core-pc.com/WCC2/API/Tickets/',
   :headers =>  {'Content-Type' => 'application/json', "Authorization" => "LTToken  #{@token}",
         "User-Agent" => "robert" },
   :body => {
    "TicketID": '0',
    "ClientID": @labclient,
    "ProjectID": '0',
    "ComputerID": @labcomputer,
    "StatusID": @status,
    "Subject": @subject,
    "Time": '0',
    "PriorityID": '10',
    "UserID": @labuser,
    "DueDate": @start,
    "StartedDate": @start,
    "ContactDate": @start,
    "UpdateDate": @start + (@hours * 3600) +( @mins * 60),
    "RequestorEmail": @labrequest,
    "CCEmail": "",
    "Level": '1',
    "Category": '5',
    "LocationID": @lablocation,
    "ExternalID": '0',
    "GUID": ""}.to_json
  )
 
  
  
  @getresult = HTTParty.get('http://labtech.core-pc.com/WCC2/API/Tickets/?$top=1&$orderby=TicketID desc',
  :headers =>  {'Content-Type' => 'application/json', "Authorization" => "LTToken  #{@token}",
         "User-Agent" => "robert" } )
        
   @ticketid = @getresult['value'][0]['TicketID']
  
   puts @response.body
  
   @response_request = HTTParty.post('http://labtech.core-pc.com/WCC2/API/TicketData/',
   :headers =>  {'Content-Type' => 'application/json', "Authorization" => "LTToken  #{@token}",
         "User-Agent" => "robert" },
   :body => {
  "TicketDataID": '0',
  "TicketID": @ticketid,
  "DataTypeID": '1',
  "Data": @subject,
  "Attachment": "",
  "Address": "",
  "UserID": @labuser,
  "TicketDataDate": @start
 }.to_json )
  
   
   
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
        "Description": @time_subject,
        "Billed": '0',
        "CategoryID": @category 
       }.to_json )
      end 
       
       def travel_time   
      if self.labtech_timeslip_id == 5
        
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
       else
          travel_times = ""
        end
  end  
end
