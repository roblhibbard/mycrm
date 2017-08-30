class ContractServiceLinesController < ApplicationController
  before_action :set_contract_service_line, only: [:show, :edit, :update, :destroy]

  # GET /contract_service_lines
  # GET /contract_service_lines.json
  def index
    @contract_service_lines = ContractServiceLine.all
  end

  # GET /contract_service_lines/1
  # GET /contract_service_lines/1.json
  def show
  end

  # GET /contract_service_lines/new
  def new
    @contract_service_line = ContractServiceLine.new
  end

  # GET /contract_service_lines/1/edit
  def edit
  end

  # POST /contract_service_lines
  # POST /contract_service_lines.json
  def create
    @contract_service_line = ContractServiceLine.new(contract_service_line_params)

    respond_to do |format|
      if @contract_service_line.save
        format.html { redirect_to @contract_service_line, notice: 'Contract service line was successfully created.' }
        format.json { render :show, status: :created, location: @contract_service_line }
      else
        format.html { render :new }
        format.json { render json: @contract_service_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contract_service_lines/1
  # PATCH/PUT /contract_service_lines/1.json
  def update
    respond_to do |format|
      if @contract_service_line.update(contract_service_line_params)
        format.html { redirect_to @contract_service_line, notice: 'Contract service line was successfully updated.' }
        format.json { render :show, status: :ok, location: @contract_service_line }
      else
        format.html { render :edit }
        format.json { render json: @contract_service_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contract_service_lines/1
  # DELETE /contract_service_lines/1.json
  def destroy
    @contract_service_line.destroy
    respond_to do |format|
      format.html { redirect_to contract_service_lines_url, notice: 'Contract service line was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contract_service_line
      @contract_service_line = ContractServiceLine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contract_service_line_params
      params.require(:contract_service_line).permit(:id, :qty, :contract_service_id, :service_list_id, :line_comment, :client_id, :total, :sub_total, :tax_total, :destroy)
    end
end
