class ClientsController < ApplicationController
  
 
  before_action :set_backup
  before_action :authenticate_user!
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  

  # GET /clients
  # GET /clients.json
  def merge
    @primary = Client.find(params[:primary_id])
    @secondary = Client.find(params[:secondary_id])
  
   #merge primary_backup and secondary_backup
   @primary.attributes = @secondary.attributes.except("id", "created_at", "updated_at")
   .delete_if { |k, v| v.blank? }
   #merge tickets
   @secondary.tickets.update_all(client_id: @primary.id)
   #merge backups
   @secondary.backups.update_all(client_id: @primary.id)
   #merge computers
   @secondary.computers.update_all(client_id: @primary.id)
   #merge parts
   @secondary.parts.update_all(client_id: @primary.id)
   #merge dispatches
   @secondary.dispatches.update_all(client_id: @primary.id)
   #merge items
   @secondary.items.update_all(client_id: @primary.id)
   #merge dispatches
   @secondary.anti_viri.update_all(client_id: @primary.id)
   #merge Contract_services
   @secondary.contract_services.update_all(client_id: @primary.id)
   #merge Contract_service_lines
   @secondary.contract_service_lines.update_all(client_id: @primary.id)
   #save backup merge
   @primary.save
   #remove secondary_backup
   @secondary.destroy
      respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Client was successfully Merged then destroyed.' }
      format.json { head :no_content }
     
     end
  end
  
  def index
    
     #@duplicate = Client.select(:email).(group(:email).having("count(*) > 1")
     #@duplicate_clients = @duplicate.where.not(:email <> '' )
     
    #@duplicate_clients = Client.find_duplicates.order(:first_name)
      if params[:query].present?
      @clients = Client.order(:id).search params[:query],
       page: params[:page], per_page: 10
       #index_name: [Computer.searchkick_index.name, Client.searchkick_index.name]
       
      @computers = Computer.search(params[:query], page: params[:page], per_page: 10)
      else
      @clients = Client.all.order(:company).page params[:page]
      
      end
  end
     
  def autocomplete
    render json: Client.search(params[:term], {
      index_name: [Computer.searchkick_index.name, Client.searchkick_index.name],
      fields: ["first_name", "last_name", "company", "email", "phone_number", "computer_corepc_number", "address"],
      match: :text_start,
      limit: 15,
      load: false,
      misspellings: {below: 5},
      }).map(&:last_name)
  end
  
  def import
    Client.import(params[:file])
    redirect_to root_url, notice: "Clients imported."
  end
  
  # GET /clients/1
  # GET /clients/1.json
  def show
    @client = Client.find(params[:id])
    #@ticket = Client.all.includes(:tickets)
    #@ticket = Ticket.find_by_client_id(params[:id])
    @tickets = Ticket.where(client_id: params[:id])
    #@clients = Client.all.includes(:assets)
    #@System = Client.all.includes(:computers)
    #@systems = Computer.where(client_id: params[:id])
    #@computer = Client.all.includes(:computers)
    @computers = Computer.where(client_id: params[:id]).limit(5)
    @backups = Backup.where(client_id: params[:id])
    #@anti_viri = AntiVirus.find_by_id(params[:anti_virus_id]) if params[:anti_virus_id]
    @anti_viri = @client.anti_viri
    @backups = @client.backups
    @tickets = @client.tickets.last(3)
    @service_lists = @client.service_lists
    @contract_services = @client.contract_services
    @contract_service_lines = @client.contract_service_lines
    #@service_lists = ServiceList.find_by id: params["service_list_id"]
    #@contract_service = ContractService.total
    #@total = @contract_services.to_a.sum{|contract_service| total = contract_service.licence_number.to_f * contract_service.service_list.charge.to_f}
    #puts @contract_services
    @commentable = Client.find_by_id(params[:client_id]) if params[:client_id]
    #@contract_services_sum_charges = ContractService.total
   
    #@computers = @ticket.computers
  end

  # GET /clients/new
  def new
     
    @client = current_user.clients.build
    @system = Client.all.includes(:systems)
    @computer = Client.all.includes(:computers)
  end

  # GET /clients/1/edit
  def edit
    @client = Client.find(params[:id])
    
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = current_user.clients.build(client_params)
     
    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Client was successfully created.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Client was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
      session[:client] = @client.id
      
    end
    def set_backup
      @backup = Backup.find_by id: params["backup_id"]
      
      #@backup = Backup.find_by id: params[backup]
      
    end
    
    

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:company, :backup_account, :first_name, :primary_contact, :last_name, 
      :phone_number, :fax, :cell, :secondary_contact, :email, :address, :city, :state, :zip_code, :full_name, :other_clientid, 
      :corepc_number, :secondary_id, :primary_id,
      tickets_attributes: [:id,:ticket_title, :issue_id, :issue_name, :priority_id, :priority_name, :description, :due_date, :tech, :client_id,
                                     :status_id, :user_id, :corepc_number, :computer_id, :location_id] )
    end
end
