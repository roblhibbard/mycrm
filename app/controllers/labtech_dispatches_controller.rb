class LabtechDispatchesController < ApplicationController
  before_action :authenticate_user!
  require 'httparty'

  require 'labtech'
  before_action :set_labtech_dispatch, only: [:show, :edit, :update, :destroy]

  # GET /labtech_dispatches
  # GET /labtech_dispatches.json
  def autocomplete
    render json: LabtechDispatch.search(params[:term], {
      fields: ["name", "phone", 'email', 'company'],
      match: :text_start,
      limit: 15,
      load: false,
      misspellings: {below: 5},
      }).map(&:details)
  end
  
  def index
    
      if params[:q].present?
       @labtech_dispatches = LabtechDispatch.search(params[:q], page: params[:page], per_page: 10)
      else
       @labtech_dispatches = LabtechDispatch.all.order("created_at DESC").page params[:page]   
      end
  end

  # GET /labtech_dispatches/1
  # GET /labtech_dispatches/1.json
  def show
    
  # @labticket = @labtech_dispatch.labtickets.find_by(params[:id])
   #@labticket = @labtech_dispatch.labticket.id
   @labticket = Labticket.joins(:labtech_dispatch).where('labtickets.labtech_dispatch_id = ?', params[:id]).
   pluck('labtickets.time_subject as description, hours as hours, mins as mins, lticket_id as lticket_id ')
   #@labticket = @labtech_dispatch.labtickets.where('labtech_dispatch_id ')
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
    def set_labtech_dispatches
      @labtech_dispatch = LabtechDispatch.labtickets.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def labtech_dispatch_params
      params.require(:labtech_dispatch).permit(:id, :phone, :subject, :started_date, :update_date, :requestor_email,
                                               :name, :company, :email,
      labtickets_attributes: [:labticket_id, :subject, :lab_clientid, :labtech_client_id, :labtechloc, :labtechpc, 
                     :user_id, :started_date, :requestor_email, :hours, :mins, :category, :labtech_timeslip_id, :labtime,
                     :lab_request, :time_subject, :c, :lab_ticket_status_id, :timeslip_category_id, :lticket_id ],
                     timeslip_category_attributes: [:id, :name, :labtime ])
    end
end
