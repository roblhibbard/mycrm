class ComputersController < ApplicationController
  before_action :set_computer, only: [:show, :edit, :update, :destroy]
  
  
  #autocomplete :computer, :corepc_number

  # GET /computers
  # GET /computers.json
  def index
    if params[:term].present?
    @computers = Computer.order(:corepc_number).where("corepc_number LIKE ?", "%#{params[:term]}%")
     render json: @computers.map(&:corepc_number)
    else
    @computers = Computer.all.order(:corepc_number).limit(10).offset(0).page params[:page]
    end
 end
   
   def search
    respond_to do |format|
      format.html
      format.json { @computers = Computer.search(params[:term]) }
    end
  end

  # GET /computers/1
  # GET /computers/1.json
  def show
  end
  
 

  # GET /computers/new
  def new
    @computer = Computer.new
   # @computer_list = Computer.where(:computer_id => @client.id )
    @computer_list = Computer.joins(:client).where("client_id = ?", params[:computer_id])
  end

  # GET /computers/1/edit
  def edit
  end

  # POST /computers
  # POST /computers.json
  def create
    @computer = Computer.new(computer_params)

    respond_to do |format|
      if @computer.save
        format.html { redirect_to @computer, notice: 'Computer was successfully created.' }
        format.json { render :show, status: :created, location: @computer }
      else
        format.html { render :new }
        format.json { render json: @computer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /computers/1
  # PATCH/PUT /computers/1.json
  def update
    respond_to do |format|
      if @computer.update(computer_params)
        format.html { redirect_to @computer, notice: 'Computer was successfully updated.' }
        format.json { render :show, status: :ok, location: @computer }
      else
        format.html { render :edit }
        format.json { render json: @computer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /computers/1
  # DELETE /computers/1.json
  def destroy
    @computer.destroy
    respond_to do |format|
      format.html { redirect_to computers_url, notice: 'Computer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_computer
      @computer = Computer.find(params[:id])
      #session[:client] = @client.id
      session[:computer] = @computer.id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def computer_params
      params.require(:computer).permit(:make, :model, :serial_number, :user_login, :user_password, :other_items, 
                     :system_type, :corepc_number, :client_id, :ticket_id)
    end
end
