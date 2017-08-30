
require 'mysql2'

class MyDb
  def self.conn
    Mysql2::Client.new( :host => "192.168.1.7", :username => "robert", :password => "Chang3m3", :port => "3306", :database => "labtech" )
  end
  
  def self.get_ticket
   
   
    sql = 'SELECT tickets.TicketID as ticket, tickets.Subject as subject, clients.Name as name, clients.ClientID as ID,
        FROM tickets
        JOIN clients on  tickets.ClientID = clients.ClientID
        WHERE
        Status = 2
        AND tickets.ClientID ='+'"#{params}"'
        
       
    end
end
    

 