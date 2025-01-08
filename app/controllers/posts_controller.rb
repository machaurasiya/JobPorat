class PostsController < ApplicationController
  before_action :authenticate_user!

  load_and_authorize_resource

  def index
    @posts = Post.all
  end

  def show

      # Rails.logger.debug @post.errors.full_messages
      Rails.logger.debug "Params: #{params.inspect}"

      @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    authorize! :create, @post #if authorised then create a post
    render :new

  end

  def create
    # debugger
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else

      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to post_path, status: :see_other
  end



  private
  def post_params
    params.require(:post).permit(:user_id, :title, :description, :salary, :location)
  end
end
