class CommentsController < ApplicationController
  before_action :find_commentable
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all.order(:created_at)
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = @commentable.comments.new(comment_params)

    respond_to do |format|
     if @comment.save
    format.html { redirect_back fallback_location: root_path, notice: 'Your comment was successfully posted!' }
    format.json { render :show, status: :created, location: @comment }
      else
    format.html { redirect_back fallback_location: root_path, notice: "Your comment wasn't posted!" }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_back fallback_location: root_path, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end
    
   


    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body, :commentable_id, :commentable_type)
    end
    def find_commentable
      @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @commentable = Project.find_by_id(params[:project_id]) if params[:project_id]
      @commentable = Ticket.find_by_id(params[:ticket_id]) if params[:ticket_id]
      @commentable = Backup.find_by_id(params[:backup_id]) if params[:backup_id]
      @commentable = b_task.find_by_id(params[:b_task_id]) if params[:b_task_id]
      @commentable = Dispatch.find_by_id(params[:dispatch_id]) if params[:dispatch_id]
      @commentable = Client.find_by_id(params[:client_id]) if params[:client_id]
    end
end
