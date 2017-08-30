class Labticket < ApplicationRecord
 require 'httparty'
 before_save :token, :ticket
 #after_create :create_ticket
 
  belongs_to :labtech_client
  belongs_to :user
  belongs_to :labtech_timeslip
  #belongs_to :client
  
   def token
   @token = HTTParty.post('http://labtech.core-pc.com/WCC2/API/APIToken', 
   :headers => { 'Content-Type' => 'application/json'},
   :body => "\n{\n  \"password\" : \"Chang3m3\",\n  \"username\" : \"robert\"\n}")
  
  
   end
  
  
  def ticket
  @labclient = self.labtech_client_id
  @subject = self.subject
  @request = self.lab_request
  @labuser = self.user_id
  @start = self.started_date
  @labrequest = self.requestor_email
  @hours = self.hours
  @mins = self.mins
  @category = self.labtech_timeslip_id
  @lablocation = self.labtech_location
  @labcomputer = self.labtech_computer
  @time_subject = self.time_subject
  
      
   @response = HTTParty.post('http://labtech.core-pc.com/WCC2/API/Tickets/',
   :headers =>  {'Content-Type' => 'application/json', "Authorization" => "LTToken  #{@token}",
         "User-Agent" => "robert" },
   :body => {
    "TicketID": '0',
    "ClientID": @labclient,
    "ProjectID": '0',
    "ComputerID": @labcomputer,
    "StatusID": '2',
    "Subject": @subject,
    "Time": '0',
    "PriorityID": '10',
    "UserID": @labuser,
    "DueDate": @start,
    "StartedDate": @start,
    "ContactDate": @start,
    "UpdateDate": @start,
    "RequestorEmail": @labrequest,
    "CCEmail": "",
    "Level": '0',
    "Category": '0',
    "LocationID": @lablocation,
    "ExternalID": '0',
    "GUID": ""}.to_json
  )
  
   @getresult = HTTParty.get('http://labtech.core-pc.com/WCC2/API/Tickets/?$top=1&$orderby=TicketID desc',
  :headers =>  {'Content-Type' => 'application/json', "Authorization" => "LTToken  #{@token}",
         "User-Agent" => "robert" } )
        
   @ticketid = @getresult['value'][0]['TicketID']
   
   @response_request = HTTParty.post('http://labtech.core-pc.com/WCC2/API/TicketData/',
   :headers =>  {'Content-Type' => 'application/json', "Authorization" => "LTToken  #{@token}",
         "User-Agent" => "robert" },
   :body => {
  "TicketDataID": '0',
  "TicketID": @ticketid,
  "DataTypeID": '1',
  "Data": @request,
  "Attachment": "",
  "Address": "",
  "UserID": @labuser,
  "TicketDataDate": @start
 }.to_json )
   puts @response_request.body
   puts @response_request.code
   if self.labtech_timeslip_id != 5
   
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
   else
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
       
    
       @result = HTTParty.post('http://labtech.core-pc.com/WCC2/API/TimeSlips/',
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
     end 
   def create_ticket
     
   if self.labtech_timeslip_id = '5'
   @create_ticket = puts @response.body
   @create_ticket_request = @response.request.body
   @create_timeslip_travel = puts @response1.body
   else
   @create_timeslip = puts @result.body
   end
  end  
end
