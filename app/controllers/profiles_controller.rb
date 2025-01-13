class ProfilesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_profile, only: [:show, :edit, :update, :destroy] 

  def index
    @profiles = Profile.all
  end

  def show
  end

  def new
    @profile = Profile.new
    authorize! :create, @profile #if authorised then create a profile
    render :new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to @profile
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to @profile
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @profile.destroy
    redirect_to profile_path, status: :see_other
  end

  private

  def profile_params
    params.require(:profile).permit(:user_id, :name, :mobile, :gender, :date_of_birth, :address, :city, :pincode, :profile_summury, :image)
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end
end
