class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    
    @post = Post.new(params_post)
    if @post.save
      redirect_to @post
    else

      # Rails.logger.debug @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(params_post)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private
  def params_post
    params.require(:post).permit(:title, :description, :user_id,:salary, :location)
  end
end
