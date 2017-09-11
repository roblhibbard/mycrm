class ContractServicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_contract_services, except: [:index, :merge, :index2, :show, :destroy ]
  before_action :set_contract_service, only: [:show, :edit, :update, :destroy]

  # GET clients/1/contract_services
   def merge
    @primary = ContractService.find(params[:primary_id])
    @secondary = ContractService.find(params[:secondary_id])
  
   #merge primary_backup and secondary_backup
   @primary.attributes = @secondary.attributes.except("id", "created_at", "updated_at")
   .delete_if { |k, v| v.blank? }
   #merge tickets
   @secondary.contract_service_lines.update_all(contract_service_id: @primary.id)
   #save backup merge
   @primary.save
   #remove secondary_backup
   @secondary.destroy
      respond_to do |format|
      format.html { redirect_to contract_services_url, notice: 'Contract Service was successfully Merged then destroyed.' }
      format.json { head :no_content }
     
     end
  end
  
  def index
    @contract_services_count = ContractService.count
    @contract_sub_total = ContractService.sum(:total)
    
     if @client.blank?
  
      @contract_services = ContractService.active.joins(:client).merge(Client.order(company: :asc)).page params[:page]
      
    else
    @contract_services = @client.contract_services.active.order(:client_id).page params[:page]
     @not_active = @client.contract_services.not_active.order(:client_id).page params[:page]
    end
  end
  def index2
    if @client.blank?
    @not_active = ContractService.not_active.includes(:client).order(:id).page params[:page]
    else
    @not_active = @client.contract_services.not_active.order(:client_id).page params[:page]
    end
    
  end
  # GET clients/1/contract_services/1
  def show
    #@contract_service_lines = contract_service_line.where('contract_service_active = 1')
    #@client = session[:client]
    #@Service_list = ServiceList.find_by() 
   # @contract_services_sum_charges = ServiceList.sum(:charge)
  end

  # GET clients/1/contract_services/new
  def new
    @contract_service = ContractService.new
    @contract_service = @client.contract_services.build
    #@contract_service = @service_list.contract_services.build
    contract_service_line = @contract_service.contract_service_lines.build
    
  end

  # GET clients/1/contract_services/1/edit
  def edit
    contract_service_line = @contract_service.contract_service_lines.build
  end

  # POST clients/1/contract_services
  def create
    
    if @client.nil?
    @contract_service = @contract_services.new(contract_service_params)
    else
    @contract_service = @client.contract_services.build(contract_service_params)
    end
    respond_to do |format|
   if @contract_service.save
        format.html { redirect_to ([@contract_service.client, @contract_service]), notice: 'Contract service was successfully created.' }
        format.json { render :show, status: :created, location: @contract_service }
      else
        format.html { render :new }
        format.json { render json: @contract_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT clients/1/contract_services/1
  def update
    respond_to do |format|
      if @contract_service.update(contract_service_params)
       
        format.html { redirect_to ([@contract_service.client, @contract_service]), notice: 'Contract service was successfully updated.' }
        format.json { render :show, status: :ok, location: @contract_service }
      else
        format.html { render :edit }
        format.json { render json: @contract_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE clients/1/contract_services/1
 def destroy
    @contract_service.destroy
    respond_to do |format|
      format.html { redirect_to contract_services_url, notice: 'Contract service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def non_active
    render
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contract_services
       if @client.nil?
          @client = Client.find(params[:client_id])
       else
         @contract_service = @client.contract_services.find(params[:id])
       end
    end
    def set_contract_service
      if @client.nil?
        @contract_service = ContractService.find(params[:id])
      else
      @contract_service = @client.contract_services.find(params[:id])
      end
    end

    # Only allow a trusted parameter "white list" through.
    def contract_service_params
      params.require(:contract_service).permit(:id, :name, :service_list_id, :computer_id, :service_list_name, :service_type_name, :service_list_charge, :service_list_id,
                :service_type_id, :licence_number, :licence_key, :contact_date1, :contact_date2, :contact_date3, :contact_done1, :active, :sub_total, :tax_total,
                 :total, :client_id, :user_id, :contact_done2, :contact_done3, :service_date, :next_service_date,:notes, :rim_computer, :rim_service, 
                 :rim_email, :rim_phone, :rim_charge, :total, :active,
      contract_service_lines_attributes: [:id, :qty, :tax_rate, :tax, :contract_service_id, :service_list_id, :line_comment, :client_id, :price, :total_price, :sub_total, :_destroy],
      service_lists_attributes: [:id, :service_list_id, :name, :charge, :client_id, :_destroy ],
      clients_attributes: [:client_id, :company, :first_name, :last_name, :full_name ] )
    end
end
