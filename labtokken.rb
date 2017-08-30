class Labtokken
  require 'httparty'
 
 
   response = HTTParty.post('http://labtech.core-pc.com/WCC2/API/APIToken', 
   :headers => { 'Content-Type' => 'application/json'},
   :body => "\n{\n  \"password\" : \"Chang3m3\",\n  \"username\" : \"robert\"\n}") 
   
   result = HTTParty.post('http://labtech.core-pc.com/WCC2/API/Tickets/',
   :headers => {'Content-Type' => 'application/json', "Authorization" => "LTToken  #{response}",
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
   
   puts result.headers.inspect   
   puts result.code
   puts result.body
 
  
end