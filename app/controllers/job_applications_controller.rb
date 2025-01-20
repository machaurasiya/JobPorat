class JobApplicationsController < ApplicationController
  before_action :set_post
  before_action :set_job, only: [:show, :edit, :update, :destroy] 
  before_action :authenticate_user!
  load_and_authorize_resource 

  def index
    if current_user.admin?
      @jobs = @post.job_applications.all
    elsif current_user.employer?
      if @post.user_id == current_user.id
        @jobs = @post.job_applications.all
      end
    elsif current_user.job_seeker?
      # @jobs = @job_applications.where(post_id: params[:post_id])
      @jobs = current_user.job_applications.where(post: @post)
    end
  end

  def show
  end

  def new 
    @job = @post.job_applications.new
    authorize! :create, @job #if authorised then create a job
    render :new
  end

  def create
    @job = @post.job_applications.new(job_application_params)

    if @job.save
      # redirect_to post_job_application_path(@post, @job), notice: "you applied this job"
      redirect_to post_path(@post), notice: "you applied this job"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @job.update(job_application_params)
      redirect_to post_job_application_path(@post, @job), notice: "Job application updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @job.destroy
    redirect_to post_job_application, status: :see_other
  end

  def update_status
    @post = Post.find(params[:post_id])
    @job = @post.job_applications.find(params[:id])
    authorize! :update, @job

    if @job.update(status: params[:status]) 
      redirect_to post_job_application_path(@post, @job), notice: 'Job application status updated successfully.'
    else
      redirect_to post_job_application_path(@post, @job), alert: 'Failed to update the status.'
    end
  end

  private

  def job_application_params
    params.require(:job_application).permit(:user_id, :post_id, :resume, :status )
  end

  def set_post
    @post = Post.find(params[:post_id])  # Fetch the post using the post_id 
  end

  def set_job
    @job = @post.job_applications.find(params[:id])
  end
end
