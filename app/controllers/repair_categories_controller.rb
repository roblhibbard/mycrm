class RepairCategoriesController < ApplicationController
  before_action :set_repair_category, only: [:show, :edit, :update, :destroy]

  # GET /repair_categories
  # GET /repair_categories.json
  def index
    @repair_categories = RepairCategory.all
  end

  # GET /repair_categories/1
  # GET /repair_categories/1.json
  def show
  end

  # GET /repair_categories/new
  def new
    @repair_category = RepairCategory.new
  end

  # GET /repair_categories/1/edit
  def edit
  end

  # POST /repair_categories
  # POST /repair_categories.json
  def create
    @repair_category = RepairCategory.new(repair_category_params)

    respond_to do |format|
      if @repair_category.save
        format.html { redirect_to @repair_category, notice: 'Repair category was successfully created.' }
        format.json { render :show, status: :created, location: @repair_category }
      else
        format.html { render :new }
        format.json { render json: @repair_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /repair_categories/1
  # PATCH/PUT /repair_categories/1.json
  def update
    respond_to do |format|
      if @repair_category.update(repair_category_params)
        format.html { redirect_to @repair_category, notice: 'Repair category was successfully updated.' }
        format.json { render :show, status: :ok, location: @repair_category }
      else
        format.html { render :edit }
        format.json { render json: @repair_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /repair_categories/1
  # DELETE /repair_categories/1.json
  def destroy
    @repair_category.destroy
    respond_to do |format|
      format.html { redirect_to repair_categories_url, notice: 'Repair category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_repair_category
      @repair_category = RepairCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def repair_category_params
      params.require(:repair_category).permit(:name)
    end
end
