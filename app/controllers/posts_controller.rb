class PostsController < ApplicationController

  def show
    post = Post.find(params[:id])
    
    render json: post
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit, flash: { error: @post.errors.full_messages.join(", ") }
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :category)
  end
end
