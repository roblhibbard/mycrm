class LabTicketStatusesController < ApplicationController
  before_action :set_lab_ticket_status, only: [:show, :edit, :update, :destroy]

  # GET /lab_ticket_statuses
  # GET /lab_ticket_statuses.json
  def index
    @lab_ticket_statuses = LabTicketStatus.all
  end

  # GET /lab_ticket_statuses/1
  # GET /lab_ticket_statuses/1.json
  def show
  end

  # GET /lab_ticket_statuses/new
  def new
    @lab_ticket_status = LabTicketStatus.new
  end

  # GET /lab_ticket_statuses/1/edit
  def edit
  end

  # POST /lab_ticket_statuses
  # POST /lab_ticket_statuses.json
  def create
    @lab_ticket_status = LabTicketStatus.new(lab_ticket_status_params)

    respond_to do |format|
      if @lab_ticket_status.save
        format.html { redirect_to @lab_ticket_status, notice: 'Lab ticket status was successfully created.' }
        format.json { render :show, status: :created, location: @lab_ticket_status }
      else
        format.html { render :new }
        format.json { render json: @lab_ticket_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lab_ticket_statuses/1
  # PATCH/PUT /lab_ticket_statuses/1.json
  def update
    respond_to do |format|
      if @lab_ticket_status.update(lab_ticket_status_params)
        format.html { redirect_to @lab_ticket_status, notice: 'Lab ticket status was successfully updated.' }
        format.json { render :show, status: :ok, location: @lab_ticket_status }
      else
        format.html { render :edit }
        format.json { render json: @lab_ticket_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lab_ticket_statuses/1
  # DELETE /lab_ticket_statuses/1.json
  def destroy
    @lab_ticket_status.destroy
    respond_to do |format|
      format.html { redirect_to lab_ticket_statuses_url, notice: 'Lab ticket status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lab_ticket_status
      @lab_ticket_status = LabTicketStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lab_ticket_status_params
      params.require(:lab_ticket_status).permit(:name, :lab_status, :labticket_id)
    end
end
