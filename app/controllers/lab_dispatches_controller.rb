class LabDispatchesController < ApplicationController
  before_action :set_lab_dispatches
  before_action :set_lab_dispatch, only: [:show, :edit, :update, :destroy]

  # GET labtickets/1/lab_dispatches
  def index
    @lab_dispatches = @labticket.lab_dispatches
  end

  # GET labtickets/1/lab_dispatches/1
  def show
  end

  # GET labtickets/1/lab_dispatches/new
  def new
    @lab_dispatch = @labticket.lab_dispatches.build
  end

  # GET labtickets/1/lab_dispatches/1/edit
  def edit
  end

  # POST labtickets/1/lab_dispatches
  def create
    @lab_dispatch = @labticket.lab_dispatches.build(lab_dispatch_params)

    if @lab_dispatch.save
      redirect_to([@lab_dispatch.labticket, @lab_dispatch], notice: 'Lab dispatch was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT labtickets/1/lab_dispatches/1
  def update
    if @lab_dispatch.update_attributes(lab_dispatch_params)
      redirect_to([@lab_dispatch.labticket, @lab_dispatch], notice: 'Lab dispatch was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE labtickets/1/lab_dispatches/1
  def destroy
    @lab_dispatch.destroy

    redirect_to labticket_lab_dispatches_url(@labticket)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lab_dispatches
      @labticket = Labticket.find(params[:labticket_id])
    end

    def set_lab_dispatch
      @lab_dispatch = @labticket.lab_dispatches.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def lab_dispatch_params
      params.require(:lab_dispatch).permit(:phone, :name)
    end
end
