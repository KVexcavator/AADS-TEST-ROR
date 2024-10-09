class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @commentable = Comment.find_commentable(
      params[:commentable_type], 
      params[:commentable_id])
      
    @comment = Comment.build_from(
      @commentable, 
      current_user.id, 
      comment_params[:body])
  
    if @comment.save
      if params[:comment][:parent_id].present?
        parent_comment = Comment.find(params[:comment][:parent_id])
        @comment.move_to_child_of(parent_comment)
        @comment.save 
      end
      redirect_to @commentable, notice: 'Comment added successfully.'
    else
      redirect_to @commentable, alert: 'Error adding comment.'
    end
  end
  

  private

  def comment_params
    params.require(:comment).permit(:body, :parent_id)
  end
end
