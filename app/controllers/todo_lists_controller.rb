class TodoListsController < ApplicationController
  before_action :set_todo_list, only: [:show, :edit, :update, :destroy]

  # GET /todo_lists
  # GET /todo_lists.json
  def index
    
    @todo_lists = TodoList.all
    @todo_lists = TodoList.joins(:backup).find_complete.page params[:complete_page]
    @todo_lists = TodoList.includes(:client, :backup).find_complete.page params[:complete_page]
    @incomplete = TodoList.joins(:backup).find_incomplete.page params[:incomplete_page]
    @incomplete = TodoList.includes(:client, :backup).find_incomplete.page params[:incomplete_page]
    @tab_id = params[:tab] ? "#my_tabs a[href=" + %Q(##{params[:tab]}) + "]" : "#my_tabs a:first"
  end

  # GET /todo_lists/1
  # GET /todo_lists/1.json
  def show
    
   
  end

  # GET /todo_lists/new
  def new
    @todo_list = TodoList.new
    
    task = @todo_list.tasks.build
  end

  # GET /todo_lists/1/edit
  def edit
    task = @todo_list.tasks.build
  end

  # POST /todo_lists
  # POST /todo_lists.json
  def create
    @todo_list = TodoList.new(todo_list_params)
   
    respond_to do |format|
      if @todo_list.save
        format.html { redirect_to @todo_list, notice: 'Todo list was successfully created.' }
        format.json { render :show, status: :created, location: @todo_list }
      else
        format.html { render :new }
        format.json { render json: @todo_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todo_lists/1
  # PATCH/PUT /todo_lists/1.json
  def update
    respond_to do |format|
      if @todo_list.update(todo_list_params)
        format.html { redirect_to @todo_list, notice: 'Todo list was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo_list }
      else
        format.html { render :edit }
        format.json { render json: @todo_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todo_lists/1
  # DELETE /todo_lists/1.json
  def destroy
    @todo_list.destroy
    respond_to do |format|
      format.html { redirect_to todo_lists_url, notice: 'Todo list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_list
      @todo_list = TodoList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_list_params
      params.require(:todo_list).permit(:name, :task_options_id, :user_id, :full_name, :complete, :backup_full_name, :backup_id, :client_id, :ticket_id,
                     tasks_attributes: [:id, :done, :description, :_destroy ],
                     user_attributes: [:id, :email, :first_name, :last_name ],
                     backup_attributes: [:backup_id, :client_last_name ],
                     client_attributes: [:client_id, :full_name] )
    end
end
