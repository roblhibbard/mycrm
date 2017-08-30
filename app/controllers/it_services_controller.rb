class ItServicesController < ApplicationController
  before_action :set_it_service, only: [:show, :edit, :update, :destroy]

  # GET /it_services
  # GET /it_services.json
  def index
    @it_services = ItService.all
  end

  # GET /it_services/1
  # GET /it_services/1.json
  def show
  end

  # GET /it_services/new
  def new
    @it_service = ItService.new
  end

  # GET /it_services/1/edit
  def edit
  end

  # POST /it_services
  # POST /it_services.json
  def create
    @it_service = ItService.new(it_service_params)

    respond_to do |format|
      if @it_service.save
        format.html { redirect_to @it_service, notice: 'It service was successfully created.' }
        format.json { render :show, status: :created, location: @it_service }
      else
        format.html { render :new }
        format.json { render json: @it_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /it_services/1
  # PATCH/PUT /it_services/1.json
  def update
    respond_to do |format|
      if @it_service.update(it_service_params)
        format.html { redirect_to @it_service, notice: 'It service was successfully updated.' }
        format.json { render :show, status: :ok, location: @it_service }
      else
        format.html { render :edit }
        format.json { render json: @it_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /it_services/1
  # DELETE /it_services/1.json
  def destroy
    @it_service.destroy
    respond_to do |format|
      format.html { redirect_to it_services_url, notice: 'It service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_it_service
      @it_service = ItService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def it_service_params
      params.require(:it_service).permit(:name, :description, :rate, :active)
    end
end
