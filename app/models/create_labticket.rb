require 'httparty'

class CreateLabticket
  include HTTParty
  
 def self.token
   HTTParty.post('http://labtech.core-pc.com/WCC2/API/APIToken', 
   :headers => { 'Content-Type' => 'application/json'},
   :body => "\n{\n  \"password\" : \"Chang3m3\",\n  \"username\" : \"robert\"\n}")
   end
   def intialize
     @ticket = create_ticket
   end 
    
  def create_ticket 
   @ticket = HTTParty.post('http://labtech.core-pc.com/WCC2/API/Tickets/',
      :headers => {'Content-Type' => 'application/json', "Authorization" => "LTToken  #{self.token}",
                 "User-Agent" => "robert" }, 
     :body => {
    "TicketID": '0',
    "ClientID": '1',
    "ProjectID": '0',
    "ComputerID": '0',
    "StatusID": '2',
    "Subject": 'test before params',
    "Time": '0',
    "PriorityID": '0',
    "UserID": '8',
    "DueDate": '11-19-2016',
    "StartedDate": '11-19-2016',
    "ContactDate": '11-19-2016',
    "UpdateDate": '11-19-2016',
    "RequestorEmail": 'robert@core-pc.com',
    "CCEmail": "",
    "Level": '0',
    "Category": '0',
    "LocationID": '0',
    "ExternalID": '0',
    "GUID": ""}.to_json
  )
  
 
  
 
  @result = HTTParty.get('http://labtech.core-pc.com/WCC2/API/Tickets?$top=1&$orderby=TicketID desc', 
       :headers => {'Content-Type' => 'application/json', "Authorization" => "LTToken  #{self.token}",
         "User-Agent" => "robert" } )
    @ticketid = @result['value'][0]['TicketID']
   
 
  
  @timeslip = HTTParty.post('http://labtech.core-pc.com/WCC2/API/TimeSlips/',
      :headers => {'Content-Type' => 'application/json', "Authorization" => "LTToken  #{self.token}",
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
        "CategoryID" => @category 
       }.to_json )
    
    end
   end

    
    
   
   
   