class CommentsController < ApplicationController
  before_action :load_parent, only: [:create]

  def create
    @comment = @parent.comments.new(comment_params)
    if @comment.save
      redirect_to request.referer, notice: 'Comment saved!'
    else
      redirect_to request.referer, alert: @comment.errors.full_messages.first
    end
  end

  private
  
  def comment_params
    params.require(:comment).permit(:content, :user_id, :commentable_id, :commentable_type)
  end
  
  def load_parent
    if params[:category_id]
      @parent = Category.find(params[:category_id])
    elsif params[:listing_id]
      @parent = Listing.find(params[:listing_id])
    end
  end
end
