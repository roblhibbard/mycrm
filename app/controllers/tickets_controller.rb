class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  #before_action :expected_date
  # GET /tickets
  # GET /tickets.json
  
   def index

    @clients = Ticket.joins(:clients).where(client_id: params[:id])
   # @tickets = Ticket.joins(:computers).where(client_id: params[:id])
    @tickets = Ticket.all.order(:due_date).limit(10).offset(0).page params[:page]
     if params[:search]
       @tickets = Ticket.search(params[:search]).order("created_at DESC").page params[:page]
     else
       @tickets = Ticket.all.order(:due_date).limit(10).offset(0).page params[:page]
        @tickets = Ticket.all.order(:due_date).limit(10).offset(0).page params[:page]
     end
    
    #@client = Ticket.joins(:clients).where(@ticket => client.full_name)
    @open_tickets = Ticket.where.not("status_id = 8").count
    #@computers = @ticket.computer.id
    @new_tickets = Ticket.where("status_id = 4").limit(10).offset(0).page params[:page]
    @diagnostic_tickets = Ticket.where("status_id = 9").page params[:page]  
    @parts_tickets = Ticket.where("status_id = 6").page params[:page]
    @waiting_tickets = Ticket.where("status_id = 7").page params[:page]
    @in_progress_tickets = Ticket.where("status_id = 5").page params[:page]
    @completed_tickets = Ticket.where("status_id = 8").limit(10).offset(0).page params[:page]
    @expected_date = Date.today + (@open_tickets / 5) + 3.days
    #@expected_date = Ticket.due_date.created_at + 3.days
  end
 

  # GET /tickets/1
  # GET /tickets/1.json
  def show
   @diagnostic = @ticket.diagnostics.new
   @diagnostics = @ticket.diagnostics
   #@issues = @ticket.issues
   @client = @ticket.client.id
   @computers = @ticket.computers
   #@computer - @ticket.computers
   
  end
  # GET /tickets/new
  def new
    @ticket = Ticket.new
    #@computer_options = Computer.all.map{ |u| [u.corepc_number]}
    #@computer_list = Computer.joins(:client).where(clients: {client_id: @computer_options})
   # @computer_list = Computer.all.where("corepc_number = ?", params[:id])
   
   end
  

  # GET /tickets/1/edit
  def edit
    #@computer = @Ticket.computer.corepc_number
  end

  # POST /tickets
  # POST /tickets.json
  def create
    
        if @diagnostic.nil?
    @ticket = Ticket.new(ticket_params)
    #@expected_date =  @ticket.due_date + 3.days
    
   else
   
    @diagnostic = @ticket.diagnostics.build(diagnostic_params)
    @ticket = Ticket.new(ticket_params)
    @ticket = @client.tickets.build(ticket_params)
    @ticket = @computer.tickets.build(ticket_params)
    
end

    respond_to do |format|
      if @ticket.save
        
        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
      session[:ticket] = @ticket.id
    end
    
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:ticket_title, :issue_id, :issue_name, :priority_id, :priority_name, :description, :due_date, :tech, :client_id,
                                     :status_id, :user_id, :corepc_number, :computer_id, :location_id)
    end
end
