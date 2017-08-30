class LabtechLocationsController < ApplicationController
  before_action :set_labtech_location, only: [:show, :edit, :update, :destroy]
 
  require 'labtech'
  

  # GET /labtech_locations
  # GET /labtech_locations.json
  def token
    @token = Labtech.get_token
  end
  def labtech
    @location = Labtech.get_location(params[:lab_client])  
  end
  def index
    @labtech_locations = LabtechLocation.all
    @labtech_clients = LabtechLocation.joins(:labtech_client)
  end

  # GET /labtech_locations/1
  # GET /labtech_locations/1.json
  def show
    
  end
  
  def import_location
   
   @token = Labtech.get_token
   @locations = Labtech.get_locations
   #@labtech_location = @labtech_client.labtech_locations.build
   
    
     @locations['value'].each do |key|
       LabtechLocation.find_or_create_by(
       "lablocation_id" => key['LocationID'],
       "labtech_client_id" => key['ClientID'],     
       "name" => key['Name'],
       "address" => key['Address'],
       "city" => key['City'],
       "state" => key['State'],
       "zip" => key['Zip'],
       "phone" => key['Phone'],
       "fax" => key['Fax'],
       "comments" => key['comments'] )
     end
     if @locations.success?
        redirect_to labtech_locations_url, notice: 'Labtech location was successfully synced.'
     else
        redirect_to labtech_locations_url, notice: 'Labtech location not successfull.'
        
     end
   end
   
  # GET /labtech_locations/new
  def new
    @labtech_location = @labtech_client.labtech_locations.build  
  end

  # GET /labtech_locations/1/edit
  def edit
  end

  # POST /labtech_locations
  # POST /labtech_locations.json
  def create
    @labtech_location = LabtechLocation.new(labtech_location_params)
    @labtech_location = @labtech_client.labtech_locations.build(labtech_location_params)

    respond_to do |format|
      if @labtech_location.save
        format.html { redirect_to @labtech_location, notice: 'Labtech location was successfully created.' }
        format.json { render :show, status: :created, location: @labtech_location }
      else
        format.html { render :new }
        format.json { render json: @labtech_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /labtech_locations/1
  # PATCH/PUT /labtech_locations/1.json
  def update
    respond_to do |format|
      if @labtech_location.update(labtech_location_params)
        format.html { redirect_to @labtech_location, notice: 'Labtech location was successfully updated.' }
        format.json { render :show, status: :ok, location: @labtech_location }
      else
        format.html { render :edit }
        format.json { render json: @labtech_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /labtech_locations/1
  # DELETE /labtech_locations/1.json
  def destroy
    @labtech_location.destroy
    respond_to do |format|
      format.html { redirect_to labtech_locations_url, notice: 'Labtech location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_labtech_location
      @labtech_location = LabtechLocation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def labtech_location_params
      params.require(:labtech_location).permit(:id, :name, :labcomputer_id, :lclient_id, :labtech_client_id, :labtech_location_id, :lablocation_id, 
                     :address, :city, :state, :zip, :phone, :fax, :comments, :loc_name_id,
                     labtech_computers_attributes: [:computer, :labcomputer_id, :lclient_id, :name, :username, :os, :domain, :_destroy ],
                     labtech_clients_attributes: [:labtech_client_id ])
    end
end
