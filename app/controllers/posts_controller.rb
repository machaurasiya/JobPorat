class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    if params[:q].present?
      @posts = Post.where("title LIKE ? OR location LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%")
    else
      @posts = Post.all
    end
  
    # @posts = Post.where("location LIKE ?", params[:q])
  end

  def show
    Rails.logger.debug "Params: #{params.inspect}"
  end

  def new
    @post = Post.new
    authorize! :create, @post #if authorised then create a post
    render :new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to post_path, status: :see_other
  end

  private
  
  def post_params
    params.require(:post).permit(:user_id, :title, :description, :salary, :location)
  end

  def set_post
    @post = Post.find(params[:id])  # Fetch the post using the post_id 
  end
end
