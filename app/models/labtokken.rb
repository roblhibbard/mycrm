class Labtokken
  include HTTParty
  
  @labclient = '1'
  @subject = 'test'
  @labuser = '8'
  @start = '2016-11-15'
  @labrequest = 'robert@core-pc.com'
  
    def initialize
      @token = Labtokken.create_token
      @posts = Labtokken.create_ticket
    end
    def self.create_token
   HTTParty.post('http://labtech.core-pc.com/WCC2/API/APIToken', 
   :headers => { 'Content-Type' => 'application/json'},
   :body => "\n{\n  \"password\" : \"Chang3m3\",\n  \"username\" : \"robert\"\n}") 
    end
    def self.create_ticket
     HTTParty.post('http://labtech.core-pc.com/WCC2/API/Tickets/',
      :headers => {'Content-Type' => 'application/json', "Authorization" => "LTToken  #{@token}",
                 "User-Agent" => "robert" }, 
     :body => {
    "TicketID": '0',
    "ClientID": @labclient,
    "ProjectID": '0',
    "ComputerID": '0',
    "StatusID": '2',
    "Subject": @subject,
    "Time": '0',
    "PriorityID": '0',
    "UserID": @labuser,
    "DueDate": @start,
    "StartedDate": @start,
    "ContactDate": @start,
    "UpdateDate": @start,
    "RequestorEmail": @labrequest,
    "CCEmail": "",
    "Level": '0',
    "Category": '0',
    "LocationID": '0',
    "ExternalID": '0',
    "GUID": ""}.to_json
  )
     end
  
end