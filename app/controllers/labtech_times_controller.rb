class LabtechTimesController < ApplicationController
  require 'labtech'
  require 'pp'
  before_action :set_labtech_time, only: [:show, :edit, :update, :destroy]

  # GET /labtech_times
  # GET /labtech_times.json
  def index
    
    @labtech_times = LabtechTime.all.
                     order(:lab_date).page params[:page]
     
  end
  def support_hours_report
   @client_id = params[:client_id]
   @month = params[:labmonth]
    @total_hours1 = Kaminari.paginate_array(LabtechTime.left_outer_joins(:labtech_client).
                   
                   where('labtech_clients.support_mins > 0').or(LabtechTime.left_outer_joins(:labtech_client).
                   where('extract(MONTH from labtech_times.lab_date) = ?', params[:labmonth]).where('labtech_clients.support_mins > 0')).
                   #or(LabtechTime.left_outer_joins(:labtech_client).no_hours).
                   group('lclient_id').
                   #having('count(labtech_times.id) > ?', 0 ).
                   pluck('labtech_times.lclient_id, company_name as name, count(labtech_times.id)
                                     as count, sum(labtech_times.hours)*3600 as hours, 
                                     sum(labtech_times.mins)*60 as mins, (labtech_clients.support_mins)/60 as support', )).
                   page(params[:page]).per(10) 
    @total_hours = Kaminari.paginate_array(LabtechTime.joins(:labtech_client).no_hours.
                   where('extract(MONTH from labtech_times.lab_date) = ?', params[:labmonth]).
                   group('lclient_id').
                    
                   pluck('labtech_times.lclient_id, company_name as name, count(labtech_times.id)
                                     as count, sum(labtech_times.hours)*3600 as hours, 
                                     sum(labtech_times.mins)*60 as mins, (labtech_clients.support_mins)/60 as support', )).
                   page(params[:page]).per(10)
      @client_timesheets = Kaminari.paginate_array(LabtechTime.joins(:labtech_client).
                   where('labtech_clients.lclient_id = ? ', @client_id).
                   where('extract(MONTH from labtech_times.lab_date) = ?', params[:labmonth]).
                   pluck('labtech_clients.lclient_id, labtech_clients.company_name as name, labtech_times.timeslip_id as time_id,
                   labtech_times.hours as hours, labtech_times.mins as mins, labtech_times.lab_date as labdate')).
                   page(params[:page]).per(10) 
                                 
    @hours_no = LabtechClient.no_hours.pluck('lclient_id as lclient_id')
     pp    LabtechClient.includes(:labtech_times).no_hours                     
                 
    @total_hours_mins = LabtechTime.sum("((hours * 60) + mins)/60")
    
    @ttl_count = Kaminari.paginate_array(LabtechTime.left_outer_joins(:labtech_client).
                 group('lclient_id').
                 where('labtech_clients.support_mins > 0').
                 #where('extract(MONTH from labtech_times.lab_date) = ?', params[:labmonth]).
                 having('count(labtech_times.id) > ?', 0 ).
                 pluck('labtech_times.lclient_id, company_name as name, count(labtech_times.id)
                                     as count, sum(labtech_times.hours)*3600 as hours, 
                                     sum(labtech_times.mins)*60 as mins, (labtech_clients.support_mins)/60 as support', )).
                 page(params[:page]).per(10)  
       
       @no_hours1 = Kaminari.paginate_array(LabtechTime.left_outer_joins(:labtech_client).no_hours.
                   pluck('labtech_times.lclient_id, company_name as name, count(timeslip_id) as count,
                   (labtech_clients.support_mins)/60 as support' )).
                   page(params[:page]).per(10)                     
       
    @client_support = Kaminari.paginate_array(LabtechClient.non_contract.
                   group('lclient_id').
                   
                   #where('extract(MONTH from labtech_times.lab_date) = ?', params[:labmonth]).
                   #having(LabtechTime.no_hours).
                   pluck('labtech_clients.lclient_id, company_name as name, (labtech_clients.support_mins) as support ' )).
                   
                   page(params[:page]).per(10) 
     
     @labtech_clients = LabtechTime.left_outer_joins(:labtech_client).
                        pluck('labtech_times.lclient_id, count(labtech_times.id) as labtech_times_count')
                       # group('labtech_times.lclient_id')    
                       #select('labtech_times.lclient_id, company_name as name, count(labtech_times.id)
                               #as count, sum(labtech_times.hours)*3600 as hours, 
                              #sum(labtech_times.mins)*60 as mins, (labtech_clients.support_mins)/60 as support' )
                                
                        
     @labtech_times = LabtechTime.where('extract(MONTH from labtech_times.lab_date) = ?', params[:labmonth]).group(:lclient_id).
                     pluck('count(labtech_times.id) as count, sum(labtech_times.hours)*3600 as hours, 
                            sum(labtech_times.mins)*60 as mins ' ) 
                                  
    # @hours = @labtech_clients.joins(@labtech_times).group(:lclient_id)
     #@all_hours = @hours.all.sum('labtech_times.hours')
                       
  
     
    
    end
    def client_timesheet_report
        @client_id = params[:client_id]
        @month = params[:labmonth]
        @client_timesheets = Kaminari.paginate_array(LabtechTime.joins(:labtech_client).order(:lab_date).
                   where('labtech_clients.lclient_id = ? ', @client_id).
                   where('extract(MONTH from labtech_times.lab_date) = ?', params[:labmonth]).
                   pluck('labtech_clients.lclient_id, labtech_clients.company_name as name, labtech_times.timeslip_id as time_id, 
                   labtech_times.ticketid as ticketid,
                   labtech_times.hours as hours, labtech_times.mins as mins, labtech_times.lab_date as labdate')).
                   page(params[:page]).per(10) 
                   
       @ttl_hours = Kaminari.paginate_array(LabtechTime.joins(:labtech_client).
                   where('labtech_clients.lclient_id = ? ', @client_id).
                   where('extract(MONTH from labtech_times.lab_date) = ?', params[:labmonth]).
                   pluck('sum(labtech_times.hours)*3600 as hours, 
                            sum(labtech_times.mins)*60 as mins,(labtech_clients.support_mins)/60 as support')).
                   page(params[:page]).per(10)
                   
       @count_timeslips = LabtechTime.joins(:labtech_client).                       
                       where('extract(MONTH from labtech_times.lab_date) = ?', params[:labmonth]).
                       where("count(labtech_times.id) = '0'" )
                       
                            
    end
    
    def total_hours_none
       @labtech_clients = LabtechClient.where(:support_mins > 0)
          
    end
  def dtl_hours
     @dtl_hours  =   LabtechTime.
                     where('extract(MONTH from labtech_times.lab_date) = ?', 5 ).
                     where('lclient_id = 12 ').
                     page(params[:page]).per(10) 
      @ttl = LabtechTime.joins(:labtech_client).group(:lclient_id).sum("((hours * 60) + mins)/60")
 @total_hours = Kaminari.paginate_array(LabtechTime.joins("INNER JOIN labtech_clients ON labtech_clients.lclient_id = labtech_times.lclient_id").
                     group('lclient_id').where('labtech_clients.support_mins > 0').
                     pluck("labtech_times.lclient_id, company_name as name, sum(labtech_times.hours)*3600 as hours, 
                     sum(labtech_times.mins)*60 as mins, (labtech_clients.support_mins)/60 as support")).page(params[:page]).per(10)
               
                     
    #@labtech_clients = LabtechClient.where(labtech_client_id: params[:id])
    @total_hours_mins = LabtechTime.sum("((hours * 60) + mins)/60")               
                     
  end
  

  # GET /labtech_times/1
  # GET /labtech_times/1.json
  def show
  end
  
  # GET /labtech_times/new
  def new
    @labtech_time = LabtechTime.new
  end

  # GET /labtech_times/1/edit
  def edit
  end
  def import_timeslips

    @labtech_time = LabtechTime.new
    @token = Labtech.get_token
    @labtech_time = Labtech.get_timeslips(params[:labmonth])
  ``
    @labtech_time['value'].each do |key|
    
    LabtechTime.find_or_create_by(
       "timeslip_id" => key['TimeSlipID'],
       "lclient_id" => key['ClientID'],
       "ticketid" => key['TicketID'],
       "hours" => key['Hours'],
       "mins" => key['Mins'],
       "done" => key['Done'],
       "lab_date" => key['Date'],
       "description" => key['Description'],
       "labtech_id" => key['UserID'],
       #"labtech_client_id" => key['ClientID'],
      )  
      
    
  end
  if @labtech_time.success?
         redirect_to labtech_times_url, notice: 'Labtech Timeslips were successfully synced.'
      else
         redirect_to labtech_times_url, notice: 'Labtech Timeslips failed to Sync.'
      end
  end    
  def update_timeslips
    LabtechTime.destroy_all("lab_date > '2017-05-30'")
   @labtech_time = LabtechTime.new
   # @token = Labtech.get_token
    #@labtech_time = Labtech.get_timeslips(params[:labmonth])
  ``
    #@labtech_time['value'].each do |key|
    
    #LabtechTime.first_or_initialize.update_attributes!(
    

  
    redirect_to labtech_times_url, notice: 'Labtech Timeslips were successfully synced.'
     
  end    
  # POST /labtech_times
  # POST /labtech_times.json
  def create
    @labtech_time = LabtechTime.new(labtech_time_params)

    respond_to do |format|
      if @labtech_time.save
        format.html { redirect_to @labtech_time, notice: 'Labtech time was successfully created.' }
        format.json { render :show, status: :created, location: @labtech_time }
      else
        format.html { render :new }
        format.json { render json: @labtech_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /labtech_times/1
  # PATCH/PUT /labtech_times/1.json
  def update
    respond_to do |format|
      if @labtech_time.update(labtech_time_params)
        format.html { redirect_to @labtech_time, notice: 'Labtech time was successfully updated.' }
        format.json { render :show, status: :ok, location: @labtech_time }
      else
        format.html { render :edit }
        format.json { render json: @labtech_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /labtech_times/1
  # DELETE /labtech_times/1.json
  def destroy
    @labtech_time.destroy
    respond_to do |format|
      format.html { redirect_to labtech_times_url, notice: 'Labtech time was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_labtech_time
      @labtech_time = LabtechTime.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def labtech_time_params
      params.require(:labtech_time).permit(:timeslip_id, :labtech_id, :ticketid, :hours, :mins, :done, :lab_date, :description, :user_id, :labticket_id, 
                                           :lclient_id, :labmonth, :labtech_client_id, :total_hours, :total_min, :client_name, :support_mins, 
                    labtech_clients_attributes: [:id, :name, :lclient_id, :company_name, :first_name, :last_name, :address1, :address2,
                     :city, :state, :phone, :zip_code, :support_mins ] )
    end
end
