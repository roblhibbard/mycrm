class TaskOptionsController < ApplicationController
  before_action :set_task_option, only: [:show, :edit, :update, :destroy]

  # GET /task_options
  # GET /task_options.json
  def index
    @task_options = TaskOption.all
  end

  # GET /task_options/1
  # GET /task_options/1.json
  def show
  end

  # GET /task_options/new
  def new
    @task_option = TaskOption.new
  end

  # GET /task_options/1/edit
  def edit
  end

  # POST /task_options
  # POST /task_options.json
  def create
    @task_option = TaskOption.new(task_option_params)

    respond_to do |format|
      if @task_option.save
        format.html { redirect_to @task_option, notice: 'Task option was successfully created.' }
        format.json { render :show, status: :created, location: @task_option }
      else
        format.html { render :new }
        format.json { render json: @task_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_options/1
  # PATCH/PUT /task_options/1.json
  def update
    respond_to do |format|
      if @task_option.update(task_option_params)
        format.html { redirect_to @task_option, notice: 'Task option was successfully updated.' }
        format.json { render :show, status: :ok, location: @task_option }
      else
        format.html { render :edit }
        format.json { render json: @task_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_options/1
  # DELETE /task_options/1.json
  def destroy
    @task_option.destroy
    respond_to do |format|
      format.html { redirect_to task_options_url, notice: 'Task option was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_option
      @task_option = TaskOption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_option_params
      params.require(:task_option).permit(:option)
    end
end
