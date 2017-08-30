class TicketCommentsController < ApplicationController
  before_action :set_comments, only: [:show, :edit, :update, :destroy] 
  before_action :set_comment, only: [:show, :edit, :update, :destroy] 

  # GET tickets/1/comments
  def index
    @comments = @ticket.comments
  
  end

  # GET tickets/1/comments/1
  def show
  end

  # GET tickets/1/comments/new
  def new
    @comment = @ticket.comments.build
  end

  # GET tickets/1/comments/1/edit
  def edit
  end

  # POST tickets/1/comments
  def create
      
  
    @comment = @ticket.comments.build(comment_params)
    

 
    if @comment.save
      redirect_to([@comment.ticket, @comment], notice: 'Comment was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT tickets/1/comments/1
  def update
    if @comment.update_attributes(comment_params)
      redirect_to([@comment.ticket, @comment], notice: 'Comment was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE tickets/1/comments/1
  def destroy
    @comment.destroy

    redirect_to ticket_comments_url(@ticket)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    
    def set_comments
      @ticket = Ticket.find(params[:ticket_id])
    end

    def set_comment
      @comment = @ticket.comments.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:name, :content)
    end
end
