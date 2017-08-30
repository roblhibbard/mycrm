class LabtechAuditsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_labtech_audit, only: [:show, :edit, :update, :destroy]

  # GET /labtech_audits
  # GET /labtech_audits.json
  def index
    @labtech_audits = LabtechAudit.all.order(:technician, :date)
  end
  def import
    LabtechAudit.import(params[:file])
    redirect_to root_url, notice: "Audits imported."
  end
  
  # GET /labtech_audits/1
  # GET /labtech_audits/1.json
  def show
  end

  # GET /labtech_audits/new
  def new
    @labtech_audit = LabtechAudit.new
  end

  # GET /labtech_audits/1/edit
  def edit
  end

  # POST /labtech_audits
  # POST /labtech_audits.json
  def create
    @labtech_audit = LabtechAudit.new(labtech_audit_params)

    respond_to do |format|
      if @labtech_audit.save
        format.html { redirect_to @labtech_audit, notice: 'Labtech audit was successfully created.' }
        format.json { render :show, status: :created, location: @labtech_audit }
      else
        format.html { render :new }
        format.json { render json: @labtech_audit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /labtech_audits/1
  # PATCH/PUT /labtech_audits/1.json
  def update
    respond_to do |format|
      if @labtech_audit.update(labtech_audit_params)
        format.html { redirect_to @labtech_audit, notice: 'Labtech audit was successfully updated.' }
        format.json { render :show, status: :ok, location: @labtech_audit }
      else
        format.html { render :edit }
        format.json { render json: @labtech_audit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /labtech_audits/1
  # DELETE /labtech_audits/1.json
  def destroy
    @labtech_audit.destroy
    respond_to do |format|
      format.html { redirect_to labtech_audits_url, notice: 'Labtech audit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_labtech_audit
      @labtech_audit = LabtechAudit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def labtech_audit_params
      params.require(:labtech_audit).permit(:labtech_ticket, :date, :description, :technician, :category, :time, :cal_ticket, :cal_time, :time_dif, :upadted, :complete, :details)
    end
end
