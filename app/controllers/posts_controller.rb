class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    # @posts = params[:q].present? ? Post.search(params[:q]) : Post.all # search for elastic search query
    if params[:company_id].present?
      @posts = params[:q].present? ? Post.where(company_id: params[:company_id]).search(params[:q]) : Post.where(company_id: params[:company_id])
    else
      @posts = params[:q].present? ? Post.search(params[:q]) : Post.all
    end
  end

  def show
  end

  def new
    @post = Post.new
    authorize! :create, @post #if authorised then create a post
    render :new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: "Post created successfully"
    else
      render :new, status: "Something went wrong"
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
    redirect_to posts_path, status: :see_other
  end

  private
  
  def post_params
    params.require(:post).permit(:user_id, :title, :description, :salary, :location, :company_id)
  end

  def set_post
    @post = Post.find(params[:id])  # Fetch the post using the post_id 
  end
end
