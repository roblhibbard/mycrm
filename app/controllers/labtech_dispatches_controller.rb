class LabtechDispatchesController < ApplicationController
  require 'httparty'

  require 'labtech'
  before_action :set_labtech_dispatch, only: [:show, :edit, :update, :destroy]

  # GET /labtech_dispatches
  # GET /labtech_dispatches.json
  def index
    @labtech_dispatches = LabtechDispatch.all
  end

  # GET /labtech_dispatches/1
  # GET /labtech_dispatches/1.json
  def show
  end

  # GET /labtech_dispatches/new
  def new
    @labtech_dispatch = LabtechDispatch.new
    @labtech_dispatch.labtickets.build
    
  end

  # GET /labtech_dispatches/1/edit
  def edit
  end

  # POST /labtech_dispatches
  # POST /labtech_dispatches.json
  def create
    @labtech_dispatch = LabtechDispatch.new(labtech_dispatch_params)
    

    respond_to do |format|
      if @labtech_dispatch.save
        format.html { redirect_to @labtech_dispatch, notice: 'Labtech dispatch was successfully created.' }
        format.json { render :show, status: :created, location: @labtech_dispatch }
      else
        format.html { render :new }
        format.json { render json: @labtech_dispatch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /labtech_dispatches/1
  # PATCH/PUT /labtech_dispatches/1.json
  def update
    respond_to do |format|
      if @labtech_dispatch.update(labtech_dispatch_params)
        format.html { redirect_to @labtech_dispatch, notice: 'Labtech dispatch was successfully updated.' }
        format.json { render :show, status: :ok, location: @labtech_dispatch }
      else
        format.html { render :edit }
        format.json { render json: @labtech_dispatch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /labtech_dispatches/1
  # DELETE /labtech_dispatches/1.json
  def destroy
    @labtech_dispatch.destroy
    respond_to do |format|
      format.html { redirect_to labtech_dispatches_url, notice: 'Labtech dispatch was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_labtech_dispatch
      @labtech_dispatch = LabtechDispatch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def labtech_dispatch_params
      params.require(:labtech_dispatch).permit(:phone, :subject, :started_date, :update_date, :requestor_email,
      labtickets_attributes: [:subject, :lab_clientid, :labtech_client_id, :labtechloc, :labtechpc, 
                     :user_id, :started_date, :requestor_email, :hours, :mins, :category, :labtech_timeslip_id, :labtime,
                     :lab_request, :time_subject, :c, :lab_ticket_status_id ])
    end
end
