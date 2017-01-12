class ProfilesController < ApplicationController
  before_action :authorize_user

  def new
    @user = User.find(session[:user_id])
    @profile = Profile.new
    @locations = Location.where(company_id: @user.company_id)
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
    @profile = Profile.find_by(user_id: session[:user_id])
    if @profile.id == params[:id].to_i
      @user = User.find(session[:user_id])
      @locations = Location.where(company_id: @user.company_id)
      @profile = Profile.find(params[:id])
    else
      redirect_to user_path(session[:user_id])
    end
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
    @profile = Profile.find(params[:id])
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :address, :phone, :location)
  end
end
