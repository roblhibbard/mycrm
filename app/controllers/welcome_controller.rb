class WelcomeController < ApplicationController
 before_action :authenticate_user!
 require 'httparty'
 require 'labtech'
 require 'my_db'
 
  def daily_hours_report
    db = MyDb.conn 
   sql = 
    "SELECT concat(Users.Name, '') AS Username, concat('Hours ', 'TTL') as TimeCategory, 
     IFNULL(CAST(SUM(hours) AS DECIMAL(10,2)),0) as Hours, IFNULL(CAST(SUM(mins) AS  DECIMAL(10,2)),0) AS Mins, users.userid ,
    COUNT(DISTINCT timeslips.userid) as ucount
    FROM (timeslips LEFT JOIN timecategory ON timecategory.id=timeslips.category) 
    LEFT JOIN users ON users.userid=timeslips.userid 
    WHERE timeslips.Date >= CURDATE() -1 AND timeslips.Date <= CURDATE()
    AND timecategory.id IN (3,5,9,12)
    
    GROUP BY timeslips.userid"   
           
    @time_by_tech = db.query(sql)
    
     db = MyDb.conn 
   sql = 
    "SELECT concat(Users.Name, '') AS Username, concat('Hours ', 'TTL') as TimeCategory, 
     IFNULL(CAST(SUM(hours) AS DECIMAL(10,2)),0) as Hours, IFNULL(CAST(SUM(mins) AS  DECIMAL(10,2)),0) AS Mins, users.userid ,
    COUNT(DISTINCT timeslips.userid) as ucount
    FROM (timeslips LEFT JOIN timecategory ON timecategory.id=timeslips.category) 
    LEFT JOIN users ON users.userid=timeslips.userid 
     WHERE timeslips.Date >= CURDATE() -1 AND timeslips.Date <= CURDATE()+1
    AND timecategory.id IN (3,5,9,12)
    "   
           
    @ttl_hours = db.query(sql)
    db = MyDb.conn 
   sql = 
    "SELECT concat(Users.Name, '') AS Username, concat('Hours ', 'TTL') as TimeCategory, 
    CAST(SUM(hours) AS DECIMAL(10,2)) as Hours, CAST(SUM(mins) AS  DECIMAL(10,2)) AS Mins, users.userid ,
    COUNT(DISTINCT timeslips.userid) as ucount
    FROM (timeslips LEFT JOIN timecategory ON timecategory.id=timeslips.category) 
    LEFT JOIN users ON users.userid=timeslips.userid 
    WHERE timeslips.Date >= CURDATE() -1 AND timeslips.Date <= CURDATE()+1
    AND timecategory.id NOT IN (3,5,9,12)
    AND NOT timeslips.userid = 1
    
    GROUP BY timeslips.userid" 
           
    @non_billable = db.query(sql)
     db = MyDb.conn 
   sql = 
    "SELECT concat(Users.Name, '') AS Username, concat('Hours ', 'TTL') as TimeCategory, 
    CAST(SUM(hours) AS DECIMAL(10,2)) as Hours, CAST(SUM(mins) AS  DECIMAL(10,2)) AS Mins, users.userid ,
    COUNT(DISTINCT timeslips.userid) as ucount
    FROM (timeslips LEFT JOIN timecategory ON timecategory.id=timeslips.category) 
    LEFT JOIN users ON users.userid=timeslips.userid 
    WHERE timeslips.Date >= CURDATE() -1 AND timeslips.Date <= CURDATE()+1
    AND timecategory.id NOT IN (3,5,9,12)
    AND NOT timeslips.userid = 1
    "   
           
    @non_ttl_hours = db.query(sql)
    
    db.close
      respond_to do |format|
      format.html
       format.pdf do
        
        render pdf: 'welcome/daily_hours_report.html.erb',
        layout: 'pdf.html',
        template: 'welcome/daily_hours_report.pdf.erb',
        locals: {:result => @result},  
        page_size: 'Legal',
        :footer => { :right => '[page] of [topage]' },
        show_as_html: params[:debug].present?
        end
   end
   
  end
  def index
     
    db = MyDb.conn 
   sql = 
    "SELECT concat(Users.Name, '') AS Username, concat('Hours ', 'TTL') as TimeCategory, 
    CAST(SUM(hours) AS DECIMAL(10,2)) as Hours, CAST(SUM(mins) AS  DECIMAL(10,2)) AS Mins, users.userid,
    COUNT(DISTINCT timeslips.userid) as ucount
    FROM (timeslips LEFT JOIN timecategory ON timecategory.id=timeslips.category) 
    LEFT JOIN users ON users.userid=timeslips.userid 
    WHERE timeslips.Date >= CURDATE() -1 AND timeslips.Date <= CURDATE()
    AND timecategory.id IN (3,5,9,12)
    
    GROUP BY timeslips.userid"   
           
    @time_by_tech = db.query(sql)
    
     db = MyDb.conn 
   sql = 
    "SELECT concat(Users.Name, '') AS Username, concat('Hours ', 'TTL') as TimeCategory, 
     IFNULL(CAST(SUM(hours) AS DECIMAL(10,2)),0) as Hours, IFNULL(CAST(SUM(mins) AS  DECIMAL(10,2)),0) AS Mins, users.userid ,
    COUNT(DISTINCT timeslips.userid) as ucount
    FROM (timeslips LEFT JOIN timecategory ON timecategory.id=timeslips.category) 
    LEFT JOIN users ON users.userid=timeslips.userid 
     WHERE timeslips.Date >= CURDATE() -1 AND timeslips.Date <= CURDATE()+1
    AND timecategory.id IN (3,5,9,12)
    "   
           
    @ttl_hours = db.query(sql)
    db = MyDb.conn 
   sql = 
    "SELECT concat(Users.Name, '') AS Username, concat('Hours ', 'TTL') as TimeCategory, 
     IFNULL(CAST(SUM(hours) AS DECIMAL(10,2)),0) as Hours, IFNULL(CAST(SUM(mins) AS  DECIMAL(10,2)),0) AS Mins, users.userid ,
    COUNT(DISTINCT timeslips.userid) as ucount
    FROM (timeslips LEFT JOIN timecategory ON timecategory.id=timeslips.category) 
    LEFT JOIN users ON users.userid=timeslips.userid 
    WHERE timeslips.Date >= CURDATE() -1 AND timeslips.Date <= CURDATE()+1
    AND timecategory.id NOT IN (3,5,9,12)
    AND NOT timeslips.userid = 1
    
    GROUP BY timeslips.userid" 
           
    @non_billable = db.query(sql)
     db = MyDb.conn 
   sql = 
    "SELECT concat(Users.Name, '') AS Username, concat('Hours ', 'TTL') as TimeCategory, 
    IFNULL(CAST(SUM(hours) AS DECIMAL(10,2)),0) as Hours, IFNULL(CAST(SUM(mins) AS  DECIMAL(10,2)),0) AS Mins, users.userid ,
    COUNT(DISTINCT timeslips.userid) as ucount
    FROM (timeslips LEFT JOIN timecategory ON timecategory.id=timeslips.category) 
    LEFT JOIN users ON users.userid=timeslips.userid 
    WHERE timeslips.Date >= CURDATE() -1 AND timeslips.Date <= CURDATE()+1
    AND timecategory.id NOT IN (3,5,9,12)
    AND NOT timeslips.userid = 1
    "   
           
    @non_ttl_hours = db.query(sql)
    
    db.close
     
  end
end
