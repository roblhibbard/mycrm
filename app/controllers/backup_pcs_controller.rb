class BackupPcsController < ApplicationController
  before_action :set_backup_pc, only: [:show, :edit, :update, :destroy]

  # GET /backup_pcs
  # GET /backup_pcs.json
  def index
    @backup_pcs = BackupPc.all
  end

  # GET /backup_pcs/1
  # GET /backup_pcs/1.json
  def show
  end

  # GET /backup_pcs/new
  def new
    @backup_pc = BackupPc.new
  end

  # GET /backup_pcs/1/edit
  def edit
  end

  # POST /backup_pcs
  # POST /backup_pcs.json
  def create
    @backup_pc = BackupPc.new(backup_pc_params)

    respond_to do |format|
      if @backup_pc.save
        format.html { redirect_to @backup_pc, notice: 'Backup pc was successfully created.' }
        format.json { render :show, status: :created, location: @backup_pc }
      else
        format.html { render :new }
        format.json { render json: @backup_pc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backup_pcs/1
  # PATCH/PUT /backup_pcs/1.json
  def update
    respond_to do |format|
      if @backup_pc.update(backup_pc_params)
        format.html { redirect_to @backup_pc, notice: 'Backup pc was successfully updated.' }
        format.json { render :show, status: :ok, location: @backup_pc }
      else
        format.html { render :edit }
        format.json { render json: @backup_pc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backup_pcs/1
  # DELETE /backup_pcs/1.json
  def destroy
    @backup_pc.destroy
    respond_to do |format|
      format.html { redirect_to backup_pcs_url, notice: 'Backup pc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_backup_pc
      @backup_pc = BackupPc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backup_pc_params
      params.require(:backup_pc).permit(:notes, :active, :external_hd, :serial, :name, :labtech_computer, :labtech_client, :labtech_computer, :service_list, :contract_service)
    end
end
