class Labticket < ApplicationRecord
 require 'httparty'

 require 'labtech'
 before_save :ticket
 #after_create :create_ticket
 
  belongs_to :labtech_client
  belongs_to :user
  belongs_to :labtech_timeslip
  belongs_to :labtech_location
  belongs_to :labtech_computer
  #belongs_to :client
  def self.token
   @token = HTTParty.post('http://labtech.core-pc.com/WCC2/API/APIToken', 
   :headers => { 'Content-Type' => 'application/json'},
   :body => "\n{\n  \"password\" : \"Chang3m3\",\n  \"username\" : \"robert\"\n}")
   @token.inspect
  end
 
  def self.post_ticket
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
    puts @response.code
    puts @response.body
    end
 def self.get_ticket
 
  @getresult = HTTParty.get('http://labtech.core-pc.com/WCC2/API/Tickets/?$top=1&$orderby=TicketID desc',
  :headers =>  {'Content-Type' => 'application/json', "Authorization" => "LTToken  #{@token}",
         "User-Agent" => "robert" } )
         puts @getresult.code
    @ticketid = @getresult['value'][0]['TicketID']
 end
 def self.get_ticket_data
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
   end
  def self.post_timeslip
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
  def self.post_timeslip_travel
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
  @lablocation = self.labtechloc
  @labcomputer = self.labtechpc
  @time_subject = self.time_subject
  
  @token = Labticket.token
  puts Labticket.post_ticket
  
 
 
     
  
  #@post_tickets = Labtech.post_tickets(params[:labtech_client_id], params[:labtechpc], params[:subject], params[:user_id], params[:started_date],
                                # params[:requestor_email], params[:labtechloc])
      
     end 
  end  

