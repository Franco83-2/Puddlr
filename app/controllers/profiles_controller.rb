class ProfilesController < ApplicationController
  before_action :authorize_user

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = session[:user_id]
    if @profile.save
      redirect_to @profile
    else
      redirect_to new_profile_path
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
      if @profile.update(profile_params)
        redirect_to @profile
      else
        redirect_to edit_profile_path
      end
  end

  def show
    @profile = Profile.find_by(user_id: session[:user_id])
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :address, :phone)
  end
end
