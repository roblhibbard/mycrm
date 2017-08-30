class LabtechClientsController < ApplicationController
  before_action :authenticate_user!
  
  before_action :set_labtech_client, only: [:show, :edit, :update, :destroy]
  #before_action :get_labclient, only: [:show]
  require 'labtech'
  require 'pp'
  require 'my_db'
  
  
  def token
   @token = HTTParty.post('http://labtech.core-pc.com/WCC2/API/APIToken', 
   :headers => { 'Content-Type' => 'application/json'},
   :body => "\n{\n  \"password\" : \"Chang3m3\",\n  \"username\" : \"robert\"\n}") 
   end

    def index
     @labtech_clients = LabtechClient.all.order(:name).page params[:page]
     if params[:search]
       @labtech_clients = LabtechClient.search(params[:search]).order("created_at DESC").page params[:page]
     else
       @labtech_clients = LabtechClient.all.order(:name).page params[:page]
     end
       
end
  # GET /labtech_labtech_clients/1
  # GET /labtech_labtech_clients/1.json
  def show
    if params[:search]
    render "partials/client", @labtech_clients.where(lclient_id => params[:search])
     else
       LabtechClient.all
     end
  end    
        #@response = response.parsed_response["value"]
        #@labtech_client = @response
   
  # GET /labtech_labtech_clients/new
  def import_clients
   
   
   @token = Labtech.get_token
   @labtech_client = Labtech.import_clients
   
    @labtech_client['value'].each do |key|
     
       LabtechClient.find_or_create_by(
           "lclient_id" => key['ClientID'],
           "name" => key['Name'],
           "company_name" => key['Company'],
           "first_name" => key['Firstname'],
           "last_name" => key['LastName'],
           "address1" => key['Address1'],
           "address2" => key['Address2'],
           "city" => key['City'],
           "state" => key['State'],
           "zip_code" => key['Zip'],
           "phone" => key['Phone'],
           "support_mins" => key['SupportMins']
           )
           
      end
     
      if @labtech_client.success?
         @labtech_client = LabtechClient.new 
        
         redirect_to labtech_clients_url, notice: 'Labtech Clients were successfully synced.'
      else
         redirect_to labtech_clients_url, notice: 'Labtech Clients failed to Sync.'
      end
    end 
    def update_clients
   
   
   @token = Labtech.get_token
   @labtech_client = Labtech.import_clients
   
    @labtech_client['value'].each do |key|
     
       LabtechClient.first_or_initialize.update_attributes!(
           "lclient_id" => key['ClientID'],
           "name" => key['Name'],
           "company_name" => key['Company'],
           "first_name" => key['Firstname'],
           "last_name" => key['LastName'],
           "address1" => key['Address1'],
           "address2" => key['Address2'],
           "city" => key['City'],
           "state" => key['State'],
           "zip_code" => key['Zip'],
           "phone" => key['Phone'],
           "support_mins" => key['SupportMins']
           )
           
      end
     
      if @labtech_client.success?
         @labtech_client = LabtechClient.new 
        
         redirect_to labtech_clients_url, notice: 'Labtech Clients were successfully synced.'
      else
         redirect_to labtech_clients_url, notice: 'Labtech Clients failed to Sync.'
      end
    end 
  def lab_client
   
        
        @labtech_client = LabtechClient.where(:lclient_id => params[:company])
        if @labtech_client.success?
          
        end 
          
   end
   def lab_client1
     if params[:company_name].nil?
        @token = Labtech.get_token
        @labclient = LabtechClient.where(params[:id]) 
        
      else
        @token = Labtech.get_token
        @labclient = Labtech.show_clients
          
     end
   end  
  def new
     
   @labtech_client = LabtechClient.new
       
  end

  # GET /labtech_labtech_clients/1/edit
  def edit
  end

  # POST /labtech_labtech_clients
  # POST /labtech_labtech_clients.json
   def create
     
    @labtech_client = LabtechClient.new(labtech_client_params)
    
    
     respond_to do |format|
      if @labtech_client.save
      
     
   
        format.html { redirect_to @labtech_client, notice: 'Client was successfully created.' }
        format.json { render :show, status: :created, location: @labtech_client }
      else
        format.html { render :new }
        format.json { render json: @labtech_client.errors, status: :unprocessable_entity }
      end
   end
  end

  def edit
    
    #@labtech_clients = JSON.parse(labtech_clients, :symbolize_names => true)
  end

  def update
    
   respond_to do |format|
      if @labtech_client.save
        format.html { redirect_to @labtech_client, notice: 'Client was successfully updated.' }
        format.json { render :show, status: :created, location: @labtech_client }
      else
        format.html { render :new }
        format.json { render json: @labtech_client.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
     @labtech_client.destroy
    respond_to do |format|
      format.html { redirect_to labtech_clients_url, notice: 'Labtech_Client was successfully destroyed.' }
      format.json { head :no_content }
  end
 end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_labtech_client
      @labtech_client = LabtechClient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def labtech_client_params
      params.require(:labtech_client).permit(:name, :lclient_id, :company_name, :first_name, :last_name, :address1, :address2,
                     :city, :state, :phone, :zip_code, :support_mins,
                     labtech_locations_attributes: [:name, :labcomputer_id, :labtech_client_id, :labtech_location_id, :lablocation_id, 
                     :address, :city, :state, :zip, :phone, :fax, :comments])
    end
end
