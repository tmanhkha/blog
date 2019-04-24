class CommentsController < ApplicationController
  before_action :find_post
  before_action :find_comment, only: [:edit, :update, :destroy]

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

  def edit
  end

  def update
    if @comment.update(comment_params)
      flash[:notice] = 'Update successfully'
    else
      flash[:danger] = 'Update unsuccessfully'
    end

    redirect_to post_path(@post.id)
  end

  def destroy
    if @comment.destroy
      respond_to do |format|  
        format.html { redirect_to @comment.post, notice: 'Delete successfully' }
        format.js { render layout: false }
        format.json { render @comment.post, status: :created, location: @comment }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def find_post
    @post = Post.find(params[:post_id])
  end
end
