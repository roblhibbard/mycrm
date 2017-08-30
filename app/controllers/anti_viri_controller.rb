class AntiViriController < ApplicationController
  before_action :set_anti_viri, except: [:index, :show]
  before_action :set_anti_virus, only: [:show, :edit, :update, :destroy]

  # GET clients/1/anti_viri
  def index
    #if @client.nil?
      @anti_viri = AntiVirus.all
    #else
   #@anti_viri = @client.anti_viri
  end

  # GET clients/1/anti_viri/1
  def show
  end

  # GET clients/1/anti_viri/new
  def new
    @anti_virus = AntiVirus.new
    @anti_virus = @client.anti_viri.build
  end

  # GET clients/1/anti_viri/1/edit
  def edit
  end

  # POST clients/1/anti_viri
  def create
      

    @anti_virus = AntiVirus.new(anti_virus_params)
    @anti_virus = @client.anti_viri.build(anti_virus_params)

  respond_to do |format|
      if @anti_virus.save
        #format.html { redirect_to [@client, @backup], notice: 'Backup was successfully created.' }
        format.html { redirect_to [@client, @antivirus], notice: 'Anti Virus was successfully created.' }
        format.json { render :show, status: :created, location: @anti_virus }
      else
        format.html { render :new }
        format.json { render json: @backup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT clients/1/anti_viri/1
  def update
    respond_to do |format|
    if @anti_virus.update(backup_params)
        format.html { redirect_to @anti_virus, notice: 'Anti Virus was successfully updated.' }
        format.json { render :show, status: :ok, location: @anti_virus }
    else
      format.html { render :edit }
        format.json { render json: @anti_virus.errors, status: :unprocessable_entity }
    end
  end
 end

  # DELETE clients/1/anti_viri/1
  def destroy
    @anti_virus.destroy

    respond_to do |format|
      format.html { redirect_to anti_viri_url, notice: 'Anti Virus was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anti_viri
      @client = Client.find(params[:client_id])
    end

    def set_anti_virus
      if @client.nil?
      @anti_virus = AntiVirus.find(params[:id])
      else
      @anti_virus = @client.anti_viri.find(params[:id])  
    end
   end

    # Only allow a trusted parameter "white list" through.
    def anti_virus_params
      params.require(:anti_virus).permit(:rep, :username, :password, :licence_key, :licence_number, :computer, :computer_id, :service_type_id, :service_list_id,
                     :service_date, :note, :contact_date1, :contact_date2, :contact_date3, :contact_done1, :contact_done2, :contact_done3,
                     :rim_client, :rim_service, :rim_contact, :rim_email, :rim_phone, :client_id )
    end
end

