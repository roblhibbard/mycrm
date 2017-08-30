class DiagnosticsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_diagnostics
  before_action :set_diagnostic, only: [:show, :edit, :update, :destroy]

  # GET tickets/1/diagnostics
  def index
    @diagnostics = @ticket.diagnostics
  end

  # GET tickets/1/diagnostics/1
  def show
  end

  # GET tickets/1/diagnostics/new
  def new
    @diagnostic = @ticket.diagnostics.build
  end

  # GET tickets/1/diagnostics/1/edit
  def edit
  end

  # POST tickets/1/diagnostics
  def create
  
    @diagnostic = @ticket.diagnostics.build(diagnostic_params)

    if @diagnostic.save
      redirect_to([@diagnostic.ticket, @diagnostic], notice: 'Diagnostic was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT tickets/1/diagnostics/1
  def update
    if @diagnostic.update_attributes(diagnostic_params)
      redirect_to([@diagnostic.ticket, @diagnostic], notice: 'Diagnostic was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE tickets/1/diagnostics/1
  def destroy
    @diagnostic.destroy

    redirect_to ticket_diagnostics_url(@ticket)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diagnostics
      @ticket = Ticket.find(params[:ticket_id])
    end

    def set_diagnostic
      @diagnostic = @ticket.diagnostics.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def diagnostic_params
      params.require(:diagnostic).permit(:hard_drive, :mem_test, :mobo, :dumps, :scans, :temp, :chkdsk, :policies, :details)
    end
end
