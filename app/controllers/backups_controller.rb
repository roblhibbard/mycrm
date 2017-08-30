class BackupsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_backup, only: [:show, :edit, :update, :destroy]
  before_action :set_backups, except: [:index, :show, :merge, :destroy]
  
  def index
     
    #@client.full_name = backup.client.full_name
   
   # @duplicate_backups = Backup.joins(:client).find_duplicates(:full_name)
    if @client.nil? 
      @backups = Backup.order(:id)
      @backups = Backup.all.order(:id).page params[:page]
      if params[:search]
        @backups = Backup.search(params[:search]).order("created_at DESC").page params[:page]
      else
        @backups = Backup.includes(:client).all.order(:client_id).page params[:page]
      end
    else
      @backups = @client.backups.order(:email)          
      @backups = @client.backups.order(:email).page params[:page]
  end
  end
  def import    
    Backup.import(params[:file])
    redirect_to backup_path, notice: "Backup Accounts Imported."
  end
  
  def merge
    @primary_backup = Backup.find(params[:primary_backup_id])
    @secondary_backup = Backup.find(params[:secondary_backup_id])
  
   #merge primary_backup and secondary_backup
   @primary_backup.attributes = @secondary_backup.attributes.except("id", "created_at", "updated_at")
   .delete_if { |k, v| v.blank? }
   
   #save backup merge
   @primary_backup.save
   #remove secondary_backup
   @secondary_backup.destroy
      respond_to do |format|
      format.html { redirect_to backups_url, notice: 'Backup was successfully Merged then destroyed.' }
      format.json { head :no_content }
     
     end
  end
  # GET /backups/1
  # GET /backups/1.json
  def show
   @backup = Backup.find(params[:id])
   #@backup = @client.backups.find(params[:id])
   @todo_list = @backup.todo_lists.build
   @todo_lists = TodoList.where(backup_id: params[:id])
   #@comment = @backup.comments.build
   #@comments = @backup.comments
  end

  # GET /backups/new
  def new
   
    @backup = Backup.new
    @backup = @client.backups.build
    backup_pc = @backup.backup_pcs.build
  end

  # GET /backups/1/edit
  def edit
   
   
    backup_pc = @backup.backup_pcs.build
  end

  # POST /backups
  # POST /backups.json
  def create
    @backup = Backup.new(backup_params)
     @backup = @client.backups.build(backup_params)
     
    respond_to do |format|
      if @backup.save
        #format.html { redirect_to [@client, @backup], notice: 'Backup was successfully created.' }
        format.html { redirect_to [@client, @backup], notice: 'Backup was successfully created.' }
        format.json { render :show, status: :created, location: @backup }
      else
        format.html { render :new }
        format.json { render json: @backup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backups/1
  # PATCH/PUT /backups/1.json
  def update
    respond_to do |format|
      if @backup.update(backup_params)
        format.html { redirect_to @backup, notice: 'Backup was successfully updated.' }
        format.json { render :show, status: :ok, location: @backup }
      else
        format.html { render :edit }
        format.json { render json: @backup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backups/1
  # DELETE /backups/1.json
  def destroy
    @backup.destroy
    respond_to do |format|
      format.html { redirect_to backups_url, notice: 'Backup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions. 
   
    def set_tasks
      @b_task = backup.b_task.find(params[:id])
    end
    def set_backups 
      if @client.nil?    
        @client = Client.find(params[:client_id])
      else
        @backup = @client.backups.find(params[:id])  
    end 
    end
    def set_backup
      if @client.nil?
      @backup = Backup.find(params[:id])
      session[:backup] = @backup.id
      else
      @backup = @client.backups.find(params[:id])
      end
    end
   
     #Never trust parameters from the scary internet, only allow the white list through.
    def backup_params
      params.require(:backup).permit(:id, :notes, :client_id, :signup_date, :renewal_date, :assigned_to_id, :backup_account, :backup_size, 
      :size_used, :used_percent, :alerts, :devices, :rim_client, :service_type_id, :service_list_id, :client_first_name, 
      :client_last_name, :client_full_name, :status_id, :it_service_id, :qty, :price, :total_price, :service_date, :next_service_date,
      :contact_date1, :contact_date2, :contact_date3, :contact_done1, :contact_done2, :contact_done3, :rim_computer,
      :rim_service, :rim_email, :rim_phone, :rim_client, :primary_backup, :secondary_backup, :todo_list_id, :todo_list_complete, :residential, :business, :user_name,
      :password,
      todo_lists_attributes: [:id, :name, :complete, :_destroy ], tasks_attributes: [:id, :done, :description, :_destroy ],
      backup_pcs_attributes: [:id, :notes, :active, :name, :external_hd, :serial, :backup_id, :labtech_computer_id, :labtech_client_id, :client_id, :labtech_computer_id, :service_list_id, :contract_service_id],
      clients_attributes: [:client_id, :company, :first_name, :last_name, :full_name ]  )
    end
  end
  
