class LabtechClientOtherDataController < ApplicationController
  before_action :set_labtech_client_other_datum, only: [:show, :edit, :update, :destroy]
  require 'my_db'
  # GET /labtech_client_other_data
  # GET /labtech_client_other_data.json
  def index
    @labtech_client_other_data = LabtechClientOtherDatum.all
     
     db = MyDb.conn
     sql = "SELECT clients.*, computers.*
           FROM computers
           JOIN clients ON computers.clientid=clients.clientid
           WHERE clients.clientid = computers.clientid
           HAVING OS LIKE '%Windows Server%'
          
          ORDER BY clients.Name "
          
    @results = db.query(sql)  
    db.close      
    
  end
  
  def extra_data_sync
    db = MyDb.conn
    sql = "SELECT * FROM v_extradataclients"
    @results = db.query(sql)
     
    @results.each do |row| 
      LabtechClientOhterDatum.find_or_create_by(
        "lclient_id" => row['clientid'],
        "name" => row['name']
        
          )     
     
      
    end
    db.close
  end
  def server
    
  end

  # GET /labtech_client_other_data/1
  # GET /labtech_client_other_data/1.json
  def show
  end

  # GET /labtech_client_other_data/new
  def new
    @labtech_client_other_datum = LabtechClientOtherDatum.new
  end

  # GET /labtech_client_other_data/1/edit
  def edit
  end

  # POST /labtech_client_other_data
  # POST /labtech_client_other_data.json
  def create
    @labtech_client_other_datum = LabtechClientOtherDatum.new(labtech_client_other_datum_params)

    respond_to do |format|
      if @labtech_client_other_datum.save
        format.html { redirect_to @labtech_client_other_datum, notice: 'Labtech client other datum was successfully created.' }
        format.json { render :show, status: :created, location: @labtech_client_other_datum }
      else
        format.html { render :new }
        format.json { render json: @labtech_client_other_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /labtech_client_other_data/1
  # PATCH/PUT /labtech_client_other_data/1.json
  def update
    respond_to do |format|
      if @labtech_client_other_datum.update(labtech_client_other_datum_params)
        format.html { redirect_to @labtech_client_other_datum, notice: 'Labtech client other datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @labtech_client_other_datum }
      else
        format.html { render :edit }
        format.json { render json: @labtech_client_other_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /labtech_client_other_data/1
  # DELETE /labtech_client_other_data/1.json
  def destroy
    @labtech_client_other_datum.destroy
    respond_to do |format|
      format.html { redirect_to labtech_client_other_data_url, notice: 'Labtech client other datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_labtech_client_other_datum
      @labtech_client_other_datum = LabtechClientOtherDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def labtech_client_other_datum_params
      params.require(:labtech_client_other_datum).permit(:lclient_id, :name, :contract_rep, :monthly_billable_time, :monthly_emergency_time, 
                    :monthly_non_billable_time, :servers_under_contract, :workstations_under_contract, :labtech_client_id)
    end
end
