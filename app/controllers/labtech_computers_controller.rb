class LabtechComputersController < ApplicationController
  
  before_action :set_labtech_computer, only: [:show, :edit, :update, :destroy]
  require 'my_db'
  
 
  def index
    @labtech_computers = LabtechComputer.all
    @labtech_locations = LabtechComputer.joins(:labtech_location)
    
  end

  # GET /labtech_computers/1
  # GET /labtech_computers/1.json
  def show
  end
  def show_servers
    @labtech_computers = LabtechComputer.where('os like Windows Server').order(:company)
  end
 
   def sync_computers
     db = MyDb.conn
     sql = "SELECT clients.*, computers.*
           FROM computers
           JOIN clients ON computers.clientid=clients.clientid
           WHERE clients.clientid = computers.clientid
           ORDER BY clients.Name "
          
    @results = db.query(sql)  
    db.close
    
     @results.each do |row|
       LabtechComputer.find_or_create_by(
       "labcomputer_id" => row['ComputerID'],
       "lclient_id" => row['ClientID'],
       "lablocation_id" => row['LocationID'],
       "name" => row['Name'],
       "domain" => row['Domain'],
       "username" => row['LastUsername'],
       "lastcontact" => row['LastContact'],
       "os" => row['OS'] )
  
   end
      if @labtech_computer.save?
        redirect_to labtech_computers_url, notice: 'Labtech Computers was successfully synced.'
     else
        redirect_to labtech_computers_url, notice: 'Labtech Computer Sync was not successfull.'        
     end
  end

  # GET /labtech_computers/new
  def new
    @labtech_computer = LabtechComputer.new
    
  end

  # GET /labtech_computers/1/edit
  def edit
  end

  # POST /labtech_computers
  # POST /labtech_computers.json
  def create
    @labtech_computer = LabtechComputer.new(labtech_computer_params)

    respond_to do |format|
      if @labtech_computer.save
        format.html { redirect_to @labtech_computer, notice: 'Labtech computer was successfully created.' }
        format.json { render :show, status: :created, location: @labtech_computer }
      else
        format.html { render :new }
        format.json { render json: @labtech_computer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /labtech_computers/1
  # PATCH/PUT /labtech_computers/1.json
  def update
    respond_to do |format|
      if @labtech_computer.update(labtech_computer_params)
        format.html { redirect_to @labtech_computer, notice: 'Labtech computer was successfully updated.' }
        format.json { render :show, status: :ok, location: @labtech_computer }
      else
        format.html { render :edit }
        format.json { render json: @labtech_computer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /labtech_computers/1
  # DELETE /labtech_computers/1.json
  def destroy
    @labtech_computer.destroy
    respond_to do |format|
      format.html { redirect_to labtech_computers_url, notice: 'Labtech computer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_labtech_computer
      @labtech_computer = LabtechComputer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def labtech_computer_params
      params.require(:labtech_computer).permit(:computer, :labcomputer_id, :lablocation_id, :lclient_id, :labtech_location_id,
                      :name, :username, :os, :domain, :company, :clientid, :locationid, :computerid, :lastcontact, 
     labtech_locations_attributes: [:labtech_location_id, :name, :labcomputer_id, :labtech_client_id, :lclient_id, :lablocation_id, 
                     :address, :city, :state, :zip, :phone, :fax, :comments])
    end
end
