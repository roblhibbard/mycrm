class LabtechTimeslipsController < ApplicationController
  require 'labtech'
  before_action :set_labtech_timeslip, only: [:show, :edit, :update, :destroy]

  # GET /labtech_timeslips
  # GET /labtech_timeslips.json
  def index
    @labtech_timeslips = LabtechTimeslip.all
    @dtl_timeslips = LabtechTimeslip.all.where('lab_client_id = 12 ')
  end

  # GET /labtech_timeslips/1
  # GET /labtech_timeslips/1.json
  def show
    Labtech.get_token
    @last_ticket = Labtech.last_labticket
  end

  # GET /labtech_timeslips/new
  def new
    @labtech_timeslip = LabtechTimeslip.new
    @timeslip = LabtechTimeslip.all
  end

  # GET /labtech_timeslips/1/edit
  def edit
  end

  # POST /labtech_timeslips
  # POST /labtech_timeslips.json
  def create
    @labtech_timeslip = LabtechTimeslip.new(labtech_timeslip_params)

    respond_to do |format|
      if @labtech_timeslip.save
        format.html { redirect_to @labtech_timeslip, notice: 'Labtech timeslip was successfully created.' }
        format.json { render :show, status: :created, location: @labtech_timeslip }
      else
        format.html { render :new }
        format.json { render json: @labtech_timeslip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /labtech_timeslips/1
  # PATCH/PUT /labtech_timeslips/1.json
  def update
    respond_to do |format|
      if @labtech_timeslip.update(labtech_timeslip_params)
        format.html { redirect_to @labtech_timeslip, notice: 'Labtech timeslip was successfully updated.' }
        format.json { render :show, status: :ok, location: @labtech_timeslip }
      else
        format.html { render :edit }
        format.json { render json: @labtech_timeslip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /labtech_timeslips/1
  # DELETE /labtech_timeslips/1.json
  def destroy
    @labtech_timeslip.destroy
    respond_to do |format|
      format.html { redirect_to labtech_timeslips_url, notice: 'Labtech timeslip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_labtech_timeslip
      @labtech_timeslip = LabtechTimeslip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def labtech_timeslip_params
      params.require(:labtech_timeslip).permit(:name, :labtime, :started_date, :mins, :hours, :subject, :lab_client_id, :lab_ticketid, :labtech_client_id, :user_id )
    end
end
