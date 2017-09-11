class LabticketsController < ApplicationController
 before_action :authenticate_user!
 require 'httparty'
 require 'labtech'
 require 'my_db'
 
 before_action :set_labticket, only: [:show, :edit, :update, :destroy]
 #before_action :c_tickets
  
 
   def timeslip
     render :timeslip_new
     @timeslip = Timeslip.new
   end
   
    def index
   @token = Labtech.get_token
   @tickets = Labtech.request_for_help
   @critical = Labtech.get_critical_drive
   @offline = Labtech.offline_server
   @qbr = Labtech.qbr
   @hd = Labtech.get_hd
   #@external_ticket = ExternalLabtech.where(ClientID: 1)
  # @ticket_open = Labtech.ticket_open 
   

  end
  
  # GET /labtickets/1
  # GET /labtickets/1.json
  def c_tickets
         @result1 = params[:c] 
      if params[:c].present?
      
       session[:passed_variable] = params[:c]
       
       db = MyDb.conn 
        sql = 'SELECT tickets.*, clients.*
        FROM tickets
        JOIN clients on tickets.clientid = clients.clientid
        WHERE
        tickets.Status = 1
        
        AND tickets.ClientID = '+"#{@result1}"
        
        @results = db.query(sql)
        
        respond_to do |format|  
        format.html 
        format.pdf do
          
        render pdf: 'labtickets/c_tickets.pdf.erb', 
        layout: 'pdf.html',
        template: 'labtickets/c_tickets.pdf.erb',
        show_as_html: params[:debug].present?,
        locals: {:@results => @results},
        #file: "#{Rails.root}/app/views/labtickets/ctickets.pdf.erb",
        page_size: 'Legal',       
        :footer => { :right => '[page] of [topage]' },
        orientation: 'Landscape'
       
         end
        end 
      else 
       @results = ["nil"]
       respond_to do |format|  
        format.html
        format.pdf do
          
        render pdf: 'labtickets/c_tickets.pdf.erb', 
        layout: 'pdf.html',
        template: 'labtickets/c_tickets.pdf.erb',
        show_as_html: params[:debug].present?,
       # locals: {@result1 => params[:c] }, 
        #file: "#{Rails.root}/app/views/labtickets/ctickets.pdf.erb",
        page_size: 'Legal',       
        :footer => { :right => '[page] of [topage]' },
        orientation: 'Landscape'
        end
      end
   end
  end
  
  def download_tickets
     @result1 = session[:passed_variable]
       
       db = MyDb.conn 
       
        sql = 'SELECT tickets.*, clients.*
        FROM tickets
        JOIN clients on tickets.clientid = clients.clientid
        WHERE
        tickets.Status = 2
        AND tickets.ClientID = '+"#{@result1}"
        
        @results = db.query(sql)
      
      string = render_to_string(
        layout: 'pdf.html',
        template: 'labtickets/c_tickets.pdf.erb'
        )
      options = {
        orientation: 'Landscape',
        page_width: '2000',
        dpi: '300'
       }
      pdf = WickedPdf.new.pdf_from_string(string, options)  
      send_data pdf, :filename => "c_tickets.pdf", :type => "application/pdf", :disposition => "attachment"
 
  end
 
  def wicked_pdf
    WickedPdf.new.pdf_from_string(to_html)
  end
  def wicked_html
     respond_to do |format|   
        format.html
        format.pdf do
        render pdf: 'labtickets/c_tickets.pdf.erb',
        layout: 'pdf.html',
        template: 'labtickets/c_tickets.html.erb',
        locals: {:result => @result},  
        show_as_html: params[:debug].present?,
        page_size: 'Legal',       
        :footer => { :right => '[page] of [topage]' },
        orientation: 'Landscape'
     end 
  end
end
  def extra_data
    db = MyDb.conn
    sql = "SELECT IFNULL((sum(timeslips.Hours) + sum(timeslips.Mins/60)),0)
                          + `Monthly Emergency Time` AS 'Hours_Used', 
                         clients.*, v_extradataclients.*, timeslips.*
                        
           FROM timeslips 
           
           LEFT JOIN (clients LEFT JOIN v_extradataclients ON clients.clientid=v_extradataclients.clientid)
           ON timeslips.clientid=clients.clientid     
           JOIN timecategory ON timeslips.category=timecategory.ID
            
           WHERE clients.name NOT LIKE 'z%'
           AND clients.SupportMins > 0
           AND clients.ClientID <> 1
           
           AND timeslips.category IN(1,3,5,9)
           AND MONTH(DATE)=MONTH(CURDATE()) AND YEAR(DATE)=YEAR(CURDATE())
           
           GROUP BY clients.clientid
           HAVING `Servers Under Contract` > 0 
           OR `Workstations Under Contract` > 0
           
           
           
           ORDER BY clients.Name ASC "
           
    @results = db.query(sql)
    
    db.close
    
    db = MyDb.conn
    sql1 = " SELECT clients.SupportMins, v_extradataclients.*
             FROM v_extradataclients
             LEFT JOIN clients ON v_extradataclients.clientid=clients.clientid
             WHERE clients.name NOT LIKE 'z%'
             AND clients.ClientID <> 1
             AND clients.SupportMins > 0
             AND `Monthly Billable Time` = 0
             HAVING `Servers Under Contract` > 0 
             OR `Workstations Under Contract` > 0
            
            
            ORDER BY clients.Name ASC "
     
     @results1 = db.query(sql1)
    
     db.close
      respond_to do |format|
      format.html
       format.pdf do
        
        render pdf: 'extra_data.pdf.erb',
        layout: 'pdf.html',
        template: 'labtickets/extra_data.html.erb',
        locals: {:result => @result},  
        page_size: 'Legal',
        :footer => { :right => '[page] of [topage]' },
        show_as_html: params[:debug].present?,
        orientation: 'Landscape'
  end
  end
  end
  
  def show
    @token = Labtech.get_token
    @last_ticket = Labtech.last_labticket
    
    
    #@ticket_open = Labtech.ticket_open   
    
   
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "open_tickets",
        show_as_html: params.key?('debug'),
        template: "labtickets/show.pdf.erb"
        #disposition: 'attachment'
        #locals: {:labticket => @labticket}

          
           # Excluding ".pdf" extension.
      end
    end
    
   # @client_name = Labtickets.joins("INNER JOIN labtech_clients ON labtech_clients.lclient_id = labtech_times.lclient_id").where
  end
  def printer_tickets
   
 db = MyDb.conn
    sql =
 "SELECT DISTINCT 'N', Networkdevices.DeviceID, Networkdevices.Name AS ComputerName, CONVERT(CONCAT(clients.name,' ',locations.name)
 USING utf8) AS Location,  CONVERT(CONCAT(clients.Phone,' ',locations.phone) USING utf8) AS Phone, probeinternal_printermarkersupplies.`derivedPercentLeft` 
 AS TestValue,probeinternal_printermarkersupplies.prtMarkerSuppliesDescription AS 'Supply Name' 
 FROM ((probeinternal_printermarkersupplies LEFT JOIN NetworkDevices ON Networkdevices.DeviceID=probeinternal_printermarkersupplies.DeviceID 
 LEFT JOIN Computers ON Computers.ComputerID=Networkdevices.ComputerID) LEFT JOIN Locations ON Locations.LocationID=Computers.Locationid) 
 LEFT JOIN Clients ON Clients.ClientID=Computers.clientid JOIN AgentComputerData ON Computers.ComputerID=AgentComputerData.ComputerID 
 WHERE probeinternal_printermarkersupplies.`derivedPercentLeft` < 20 AND  (derivedPercentLeft <> '(NULL)'
 AND CONVERT(LEFT(derivedPercentLeft, INSTR(derivedPercentLeft, '%') - 1), DECIMAL) > 0 AND prtMarkerSuppliesMaxCapacity > 0)
 AND  NOT prtMarkerSuppliesDescription LIKE '%ink%'
 AND Computers.ComputerID IN (SELECT DISTINCT ComputerID FROM SubGroupwchildren)"
     
     @printer_tickets = db.query(sql)
 
      respond_to do |format|
      format.html
      format.pdf do
        render pdf: "printer_tickets",
        layout: 'pdf.html',
        template: "labtickets/printer_tickets.pdf.erb",
        locals: {:printer_tickets => @printer_tickets},
        #page_size: 'Legal',
        :footer => { :right => '[page] of [topage]' },
        show_as_html: params[:debug].present?,
        orientation: 'Landscape'
  end
  end
  end
  def printer_tickets_old
    @token = Labtech.get_token
    @printer_tickets = Labtech.get_printer_tickets
      respond_to do |format|
      format.html
      format.pdf do
        render pdf: "printer_tickets",
        layout: 'pdf.html',
        template: "labtickets/printer_tickets.pdf.erb",
        locals: {:printer_tickets => @printer_tickets},
        #page_size: 'Legal',
        :footer => { :right => '[page] of [topage]' },
        show_as_html: params[:debug].present?,
        orientation: 'Landscape'
  end
  end
  end

  def qbr_tickets
    @token = Labtech.get_token
    @qbr = Labtech.qbr
      respond_to do |format|
      format.html
      format.pdf do
        render pdf: "qbr_tickets",
        layout: 'pdf.html',
        template: "labtickets/qbr_tickets.pdf.erb",
        locals: {:ticket_open => @ticket_open},
        #page_size: 'Legal',
        :footer => { :right => '[page] of [topage]' },
        show_as_html: params[:debug].present?,
        orientation: 'Landscape'
  end
  end
  end
   
  def open_tickets1
      @token = Labtech.get_token
      @ticket_open = Labtech.ticket_open 
      respond_to do |format|
      format.html
      format.pdf do
        render pdf: "open_tickets",
        layout: 'pdf.html',
        template: "labtickets/open_tickets.pdf.erb",
        locals: {:ticket_open => @ticket_open},
        page_size: 'Legal',
        :footer => { :right => '[page] of [topage]' },
        show_as_html: params[:debug].present?,
        orientation: 'Landscape'
        
       
    end
   end
  end
  def open_tickets
      db = MyDb.conn
      sql ='SELECT DISTINCT tickets.*, clients.*, computers.*, computers.name as ComputerName, users.userid, users.name as UserName
         FROM tickets
        JOIN (clients JOIN computers ON computers.clientid = clients.clientid)
        ON tickets.clientid = clients.clientid
        JOIN users on tickets.userid = users.userid
        WHERE
        tickets.Status = 2
        AND tickets.UserID <> 1
        AND StartedDate < CURDATE() + 1
        GROUP BY tickets.ticketid
        ORDER BY users.Name, tickets.StartedDate ASC'
        
      @results = db.query(sql)
    
      db.close
        
      respond_to do |format|
      format.html
      format.pdf do
        render pdf: "open_tickets",
        layout: 'pdf.html',
        template: "labtickets/open_tickets.pdf.erb",
        locals: {:ticket_open => @ticket_open},
        page_size: 'Legal',
        :footer => { :right => '[page] of [topage]' },
        show_as_html: params[:debug].present?,
        orientation: 'Landscape'
        
       
    end
   end
  end
  def new_tickets
   db = MyDb.conn
      sql ="Select Tickets.TicketID, tickets.TicketID as `Ticket ID`, Tickets.Category as Category,
     Clients.Name as `Client Name`, Clients.Company as `Company`, Clients.ClientID as `ClientID`, infocategory.CategoryName as `Infobase Category`,
     Computers.ComputerID as `ComputerID`, Computers.Name as `Computer Name`,
     tickets.Subject as `Ticket Subject`, tickets.StartedDate as `Ticket Started Date`, 
     DateDiff(NOW(),Tickets.StartedDate) as `Ticket Age`, tickets.requestoremail as `Ticket Email`,
     TicketStatus.TicketStatus as `Ticket Status`, ticketpriority.name as `Ticket Priority`, .
     users.Name as `Ticket Owner`, IF(Tickets.DueDate > DATE_ADD(Tickets.StartedDate, INTERVAL -1 DAY),
      tickets.DueDate,NULL) as `Ticket Due Date`, tickets.Status as `Ticket Status #`, 
      TimeStampDiff(Hour,Tickets.startedDate,NOW()) as `Ticket Age in Hours`, Tickets.Priority as `Ticket Priority #`, 
      IF(tickets.ContactDate > tickets.UpdateDate,'True','False') as `Ticket Updated` 
      from ((((((((( Tickets Straight_JOIN Ticketpriority on TicketPriority.Priority=Tickets.Priority) 
      Straight_JOIN TicketStatus on TicketStatus.TicketStatusID=Tickets.Status) 
      LEFT JOIN Usersec on Tickets.ClientID=usersec.ClientID AND Tickets.ComputerId=usersec.ComputerID AND USersec.USerid=8)
       LEFT JOIN clients ON Clients.ClientID=Tickets.clientid) LEFT JOIN Projects ON Projects.ProjectID=Tickets.Projectid) 
       LEFT JOIN Computers ON Computers.ComputerID=Tickets.ComputerID)  
       LEFT JOIN Locations ON Computers.LocationID=Locations.LocationID)  
       Left Join Contacts on Contacts.ContactID=Computers.ContactID) 
       LEFT JOIN infocategory ON infocategory.ID=Tickets.Category) 
       LEFT JOIN Users ON Users.UserID=Tickets.UserID  WHERE not Tickets.Ticketid in (Select TicketID From Projects) 
       and Tickets.Status=1 AND Tickets.Level<=5 AND (Not ISNULL(Usersec.ComputerID) or Tickets.ClientID=0)   
       ORDER BY tickets.Subject, Clients.ClientID  ASC "
        
      @results = db.query(sql)
    
      db.close
        
      respond_to do |format|
      format.html
      format.pdf do
        render pdf: "new_tickets",
        layout: 'pdf.html',
        template: "labtickets/new_tickets.pdf.erb",
        locals: {:new_tickets => @new_tickets},
        page_size: 'Legal',
        :footer => { :right => '[page] of [topage]' },
        show_as_html: params[:debug].present?,
        orientation: 'Landscape'
        
       
    end
   end 
  end
  def monitors
   db = MyDb.conn
      sql ="SELECT agents.AgentID, Agents.Name AS `Monitor Name`, IF((SELECT COUNT(*) FROM databasefails 
WHERE databasefails.agentID=Agents.AgentID)  >0,'Detected','No Problems') AS `Monitor Status`, (CASE agents.Interval WHEN 300 THEN 'Every 5 Minutes' 
WHEN  3600 THEN 'Every Hour'  WHEN  14400 THEN 'Every 4 Hours'  WHEN  21600 THEN 'Every 6 Hours' WHEN 43200 THEN 'Every 12 Hours' WHEN 86400 THEN 'Daily' 
WHEN 604800 THEN 'Weekly' WHEN 1209600 THEN 'Bi-Weekly' WHEN 2419200 THEN 'Monthly' ELSE CONVERT(CONCAT(agents.Interval,' secs') USING UTF8) END) 
AS `Monitor Duration`, Agents.LastScan AS `Monitor Scan Date`, DATE_ADD(agents.`LastScan`,INTERVAL agents.`interval` SECOND) AS `Monitor Next Scan`, 
(SELECT NAME FROM AlertTemplate WHERE AlertActionID=Agents.AlertAction) AS `Alert Template Name`, (SELECT COMMENT FROM AlertTemplate 
WHERE AlertActionID=Agents.AlertAction) AS `Alert Template Comment`, Agents.`Interval` AS `Hidden_Interval` FROM Agents  WHERE Agents.CheckAction = 0 
 ORDER BY Agents.Name ASC "
        
      @results = db.query(sql)
    
      db.close
        
      respond_to do |format|
      format.html
      format.pdf do
        render pdf: "monitors",
        layout: 'pdf.html',
        template: "labtickets/monitors.pdf.erb",
        locals: {:monitors => @monitors},
        page_size: 'Legal',
        :footer => { :right => '[page] of [topage]' },
        show_as_html: params[:debug].present?,
        orientation: 'Landscape'
        
       
    end
   end 
  end
  def critical_drive
      @token = Labtech.get_token
      @critical_drive = Labtech.get_critical_drive
      respond_to do |format|
      format.html
      format.pdf do
        render pdf: "critical_drive",
        layout: 'pdf.html',
        template: "labtickets/critical_drive.pdf.erb",
        locals: {:ticket_open => @ticket_open},
        page_size: 'Legal',
        :footer => { :right => '[page] of [topage]' },
        show_as_html: params[:debug].present?,
        orientation: 'Landscape'
        
       
    end
   end
  end
  # GET /labtickets/new
  def new
    
   @labticket = Labticket.new
   
  end

  # GET /labtickets/1/edit
  def edit
  end
  
  def ticket
   
  end
  
  def make_labticket
   @make_labticket = Labtech.make_labticket(getparams)
   
    respond_to do |format|
   format.html { redirect_to show_labticket_labtickets_path, notice: 'Labticket was successfully created.' }
   end
  end
  def show_labticket
   Labtech.get_token 
   @labtech = Labtech.last_ticket
  end
  
  
  def hd_critical
    @hd_critical = Labtech.hd_critical
  end
  def ticket_open
    @ticket_open = Labtech.ticket_open
  end
  # POST /labtickets
  # POST /labtickets.json
 
  
  def create

   @labticket = Labticket.new(labticket_params) 
   
    respond_to do |format|
      if @labticket.save
     format.html { redirect_to @labticket, notice: 'Labticket was successfully created.' }
     format.json { render :show, status: :created, location: @labticket }  
      else
        format.html { render :new }
        format.json { render json: @labticket.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PATCH/PUT /labtickets/1
  # PATCH/PUT /labtickets/1.json
  def update
    respond_to do |format|
      if @labticket.update(labticket_params)
        format.html { redirect_to @labticket, notice: 'Labticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @labticket }
      else
        format.html { render :edit }
        format.json { render json: @labticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /labtickets/1
  # DELETE /labtickets/1.json
  def destroy
    @labticket.destroy
    respond_to do |format|
      format.html { redirect_to labtickets_url, notice: 'Labticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    
    def set_labticket
      @labticket = Labticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def labticket_params
      params.require(:labticket).permit(:subject, :lab_clientid, :labtech_client_id, :labtechloc, :labtechpc, 
                     :user_id, :started_date, :requestor_email, :hours, :mins, :category, :labtech_timeslip_id, :labtime,
                     :lab_request, :time_subject, :c, :lab_ticket_status_id,
                     
                     labtech_locations_attributes: [:labtech_location_id, :name, :labcomputer_id, :lclient_id, :labtech_client_id, :labtech_location_id, :lablocation_id, 
                     :address, :city, :state, :zip, :phone, :fax, :comments],
                     users_attributes: [:labtech_id, :first_name, :last_name, :email, :id],
                     labtech_client_attributes: [:id, :name, :lclient_id, :company_name, :first_name, :last_name, :address1, :address2,
                     :city, :state, :phone, :zip_code, :support_mins],
                     lab_ticket_statuses_attributes: [:name, :lab_status, :lab_ticket_status_id ])
    end
    def getparams
      params.require(:make_labticket).permit(:subject, :lab_client, :labtech_client, :labtechloc, :labtechpc, 
                     :started_date, :requestor_email, :hours, :mins, :category, :labtech_timeslip_id, :labtime,
                     :lab_request, :time_subject, :labtech_id,
                     labtech_locations_attributes: [:labtech_location_id, :name, :labcomputer_id, :lclient_id, :labtech_client_id, :labtech_location_id, :lablocation_id, 
                     :address, :city, :state, :zip, :phone, :fax, :comments],
                     user_attributes: [:labtech_id, :first_name, :last_name, :email, :user_id],
                     labtech_client_attributes: [:id, :name, :lclient_id, :company_name, :first_name, :last_name, :address1, :address2,
                     :city, :state, :phone, :zip_code, :support_mins],
                     lab_ticket_statuses_attributes: [:name, :lab_status, :lab_ticket_status_id ] )
     
    end
end
