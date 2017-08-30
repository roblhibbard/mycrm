class BTasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_b_tasks, except: [:index, :show, :import]
  before_action :set_b_task, only: [:show, :edit, :update, :destroy]

  # GET backups/1/b_tasks
  def index
    if @backup.nil?
      @open_tasks = BTask.where.not("status_id = 8").count
      @b_tasks = BTask.all.page(params[:page]).per(10)
      @new_b_tasks = BTask.where("status_id = 4").page(params[:page]).per(10)
      @in_progress_b_tasks = BTask.where("status_id = 5")
      @waiting_b_tasks = BTask.where("status_id = 7")
      @completed_b_tasks = BTask.where("status_id = 8")
  else
    @b_tasks = @backup.b_tasks.page(params[:page]).per(10)
    @new_b_tasks = @backup.b_tasks.where("status_id = 4").page(params[:page]).per(10)
    @in_progress_b_tasks = @backup.b_tasks.where("status_id = 5")
    @waiting_b_tasks = @backup.b_tasks.where("status_id = 7")
    @completed_b_tasks = @backup.b_tasks.where("status_id = 8")
    @open_tasks = BTask.where.not("status_id = 8").count
  end
  end
   def import
    BTask.import(params[:file])
    redirect_to root_url, notice: "Backup tasks imported."
  end
  # GET backups/1/b_tasks/1
  def show
   BTask.joins(:clients, :backups).where("clients.backup_account = backups.backup_account")
  end

  # GET backups/1/b_tasks/new
  def new
    @b_task = @backup.b_tasks.build
  end

  # GET backups/1/b_tasks/1/edit
  def edit
  end

  # POST backups/1/b_tasks
  def create
    @b_task = BTask.new(b_task_params)
    @b_task = @backup.b_tasks.build(b_task_params)

    if @b_task.save
      redirect_to([@b_task.backup, @b_task], notice: 'Backup task was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT backups/1/b_tasks/1
  def update
    if @b_task.update_attributes(b_task_params)
      redirect_to([@b_task.backup, @b_task], notice: 'Backup task was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE backups/1/b_tasks/1
  def destroy
    @b_task.destroy

    redirect_to backup_b_tasks_url(@backup)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_b_tasks
      @backup = Backup.find(params[:backup_id])
    end

    def set_b_task
      if @backup.nil?
        @b_task = BTask.find(params[:id])
      else
      @b_task = @backup.b_tasks.find(params[:id])
    end
    end

    # Only allow a trusted parameter "white list" through.
    def b_task_params
      params.require(:b_task).permit(:backup_account, :details, :description, :task_time, :status_name, :communication_name, :status_id, :communication_id)
    end
end
