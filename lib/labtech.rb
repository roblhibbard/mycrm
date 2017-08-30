require 'rubygems'
require 'httparty'

class Labtech
include HTTParty
debug_output $stderr
base_uri 'http://labtech.core-pc.com'
headers "Content-Type" => "application/json"
headers "Authorization" => "LTToken #{@token}"
headers "User-Agent" => "robert"


format :json



def self.options
  options = {
      :headers => {'Content-Type' => 'application/json', "Authorization" => "LTToken  #{@token}",
                    "User-Agent" => "robert" } }
  end

def self.get_token
  @token = post('http://labtech.core-pc.com/WCC2/API/APIToken', 
   :headers => { 'Content-Type' => 'application/json'},
   :body => "\n{\n  \"password\" : \"Chang3m3\",\n  \"username\" : \"robert\"\n}")
   @token.inspect 
   @token.code
end

def self.get_locations
  @location = get('http://labtech.core-pc.com/WCC2/API/Locations',
       :headers => {'Content-Type' => 'application/json', "Authorization" => "LTToken  #{@token}",
                    "User-Agent" => "robert" })
  end
  
  def self.show_clients
     
   response = get('/WCC2/API/Clients?$top=1&$filter=contains(Company,%27CorePC%27)&$expand=Contacts,Locations ', options )
      
  end
  def self.get_clients(params)
   
  response = get('/WCC2/API/Clients?$top=1&$filter=contains(Name,%27'"#{params}"'%27)&$expand=Contacts,Locations', options )
      
  end
  def self.import_clients
   
  response = get('/WCC2/API/Clients', options )
      
  end
  def self.get_computers
    @computer = get('http://labtech.core-pc.com/WCC2/API/Computers',
       :headers => {'Content-Type' => 'application/json', "Authorization" => "LTToken  #{@token}",
                    "User-Agent" => "robert" })
  end
  def self.get_tickets
   
     @ticket = get('http://labtech.core-pc.com/WCC2/API/Tickets',
       :headers => {'Content-Type' => 'application/json', "Authorization" => "LTToken  #{@token}",
                    "User-Agent" => "robert" })
  end
  def self.get_timeslips(params)
   
    response = get('/WCC2/API/TimeSlips?$filter=month(Date) eq+'"#{params}"' and CategoryID ne 7 and CategoryID ne 10 and CategoryID ne 11 and year(Date) eq 2017 ', options )
    
  end
  def self.get_timeslips_view
    
     response = get('/WCC2/API/TimeSlips?$top=1000&$filter=month(Date) eq 6 and CategoryID ne 7 and CategoryID ne 10 and CategoryID ne 11 and year(Date) eq 2017 ', options )
    
  end
  def self.get_critical_drive
    response = get('/WCC2/API/Tickets?$top=50&$filter=StatusID eq 2 and contains(Subject,%27Drive Space Critical%27) and ClientID ne 1&$expand=Client', options )
  end
  def self.get_hd
    response = get('/WCC2/API/Tickets?$top=50&$filter=StatusID eq 2 and contains(Subject, %271TB%27)and ClientID ne 1&$expand=Client', options )
  end
  def self.offline_server
    response = get('/WCC2/API/Tickets?$top=50&$filter=StatusID ne 4 and contains(Subject, %27Offline Servers%27) and ClientID ne 1&$expand=Client', options )
  end
 def self.qbr
    response = get('/WCC2/API/Tickets?$top=50&$filter=StatusID ne 4 and contains(Subject,%27QBR%27)and ClientID ne 1&$expand=Client ', options )
  end
  def self.last_labticket
    @getresult = get('/WCC2/API/Tickets/?$top=1&$orderby=TicketID desc', options )
  end
   def self.get_printer_tickets
    response = get('/WCC2/API/Tickets?$top=50&$filter=StatusID ne 4 and contains(Subject,%27Printer Low%27) and ClientID ne 1&$expand=Client', options )
  end
  def self.ticket_open_test
    
    @date = Date.today - 30
    response = get('/WCC2/API/TicketStubs?$filter=Status eq %27open%27&$orderby=AssignedTo ', options )
  end
  def self.ticket_open
    
    @date = Date.today
    response = get('/WCC2/API/Tickets?$filter=StatusID eq 2 and StartedDate le%20'"#{@date}"'%20&$orderby=UserID &$expand=Client', options )
  end
  def self.ticket_open_client(params)
    
    @date = Date.today
    response = get('/WCC2/API/Tickets?$filter=StatusID eq 2 and StartedDate le%20'"#{@date}"'%20&$orderby=UserID ', options )
  end
  def self.index_tickets
    @token.inspect
    
    client= "12"
   
    #response = get('/WCC2/API/Tickets/?$top=5&$filter=ClientID eq+'"#{client}"'and Category eq 5''&$orderby=TicketID desc', options  )
    response = get('/WCC2/API/Tickets/?$top=5&$filter=ClientID eq+'"#{client}"'and Category eq 5''&$orderby=TicketID desc', options  )   
    
  end
  def self.request_for_help
   
    response = get('/WCC2/API/Tickets/?$top=20&$filter=Category eq 5 and StatusID eq 1&$expand=Client', options  )    
  end
  
   
  
  def self.make_labticket(getparams)
    Labtech.get_token
    
   options = {
      :headers => {'Content-Type' => 'application/json', "Authorization" => "LTToken  #{@token}",
                    "User-Agent" => "robert" },
      :body => {
    "TicketID": '0',
    "ClientID": getparams[:labtech_client],
    "ProjectID": '0',
    "ComputerID": getparams[:labtechpc],
    "StatusID": '2',
    "Subject": getparams[:subject],
    "Time": '0',
    "PriorityID": '10',
    "UserID": getparams[:labtech_id],
    "DueDate": getparams[:started_date],
    "StartedDate": getparams[:started_date],
    "ContactDate": getparams[:started_date],
    "UpdateDate": getparams[:started_date],
    "RequestorEmail": getparams[:requestor_email],
    "CCEmail": "",
    "Level": '0',
    "Category": '5',
    "LocationID": getparams[:labtechloc],
    "ExternalID": '0',
    "GUID": ""}.to_json 
    }
    
    response = post('/WCC2/API/Tickets', options )
   
    puts response.body
    @getresult = Labtech.last_labticket
    @ticketid = @getresult['value'][0]['TicketID']
    puts @getresult['value'][0]['TicketID']
    
    options1 = {
      :headers => {'Content-Type' => 'application/json', "Authorization" => "LTToken  #{@token}",
                    "User-Agent" => "robert" },
      :body => {
   "TicketDataID": '0',
   "TicketID": @ticketid,
   "DataTypeID": '1',
   "Data": getparams[:subject],
   "Attachment": "",
   "Address": "",
   "UserID":getparams[:labtech_id],
   "TicketDataDate": getparams[:started_date],
    }.to_json 
    }
    
    response = post('/WCC2/API/TicketData', options1 )
    
  end
  def self.post_tickets(body)
    
   response = post('/WCC2/API/Tickets/', options, "#{body}")
  end
  
  def self.last_ticket
     @last_ticket = get('http://labtech.core-pc.com/WCC2/API/Tickets/?$top=1&$orderby=TicketID desc',
  :headers =>  {'Content-Type' => 'application/json', "Authorization" => "LTToken  #{@token}",
         "User-Agent" => "robert" } )
         
  end
  def self.post_ticketdata
    @ticket_data = post('http://labtech.core-pc.com/WCC2/API/TicketData/',
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
   @post_timeslip = post('http://labtech.core-pc.com/WCC2/API/TimeSlips/',
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
 def self.post_travel_timeslip
     @post_travel_timeslip = post('http://labtech.core-pc.com/WCC2/API/TimeSlips/',
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
 
   
end