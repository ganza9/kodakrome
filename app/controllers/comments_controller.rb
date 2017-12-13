class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @comment = @post.current_user.comments.build
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      flash[:alert] = "Check your comment!"
      render root_path
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])

    @comment.destroy
    flash[:success] = "Comment deleted"
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment). permit(:content)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

end
