class CommentsController < ApplicationController
  before_action :find_post

  def create
    @comment = @post.comments.new comment_params
    if @comment.save
      respond_to do |format|  
        format.html { redirect_to @comment.post, notice: 'Comment was successfully created.' }
        format.js { render layout: false }
        format.json { render @comment.post, status: :created, location: @comment }
      end
    else 
      respond_to do |format|  
        format.html { redirect_to @comment.post, notice: 'Please sign or sign up to comment' }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end

  def find_post
    @post = Post.find(params[:post_id])
  end
end
