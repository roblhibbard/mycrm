class TimeslipCategoriesController < ApplicationController
  before_action :set_timeslip_category, only: [:show, :edit, :update, :destroy]

  # GET /timeslip_categories
  # GET /timeslip_categories.json
  def index
    @timeslip_categories = TimeslipCategory.all
  end

  # GET /timeslip_categories/1
  # GET /timeslip_categories/1.json
  def show
  end

  # GET /timeslip_categories/new
  def new
    @timeslip_category = TimeslipCategory.new
  end

  # GET /timeslip_categories/1/edit
  def edit
  end

  # POST /timeslip_categories
  # POST /timeslip_categories.json
  def create
    @timeslip_category = TimeslipCategory.new(timeslip_category_params)

    respond_to do |format|
      if @timeslip_category.save
        format.html { redirect_to @timeslip_category, notice: 'Timeslip category was successfully created.' }
        format.json { render :show, status: :created, location: @timeslip_category }
      else
        format.html { render :new }
        format.json { render json: @timeslip_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timeslip_categories/1
  # PATCH/PUT /timeslip_categories/1.json
  def update
    respond_to do |format|
      if @timeslip_category.update(timeslip_category_params)
        format.html { redirect_to @timeslip_category, notice: 'Timeslip category was successfully updated.' }
        format.json { render :show, status: :ok, location: @timeslip_category }
      else
        format.html { render :edit }
        format.json { render json: @timeslip_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timeslip_categories/1
  # DELETE /timeslip_categories/1.json
  def destroy
    @timeslip_category.destroy
    respond_to do |format|
      format.html { redirect_to timeslip_categories_url, notice: 'Timeslip category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timeslip_category
      @timeslip_category = TimeslipCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def timeslip_category_params
      params.require(:timeslip_category).permit(:name, :labtime, :labtech_timeslip_id)
    end
end
