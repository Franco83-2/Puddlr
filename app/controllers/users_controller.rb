class UsersController < ApplicationController
  before_action :authorize_user
  skip_before_action :authorize_user, only: [:new, :create]

  def index
  end

  def new
    @user = User.new
    @companies = Company.all
  end

  def create
    @user = User.new(user_params)
    @companies = Company.all
    if @user.save
      session[:user_id] = @user.id
      redirect_to new_profile_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(session[:user_id])
    if @user.update(:user_params)
      redirect_to @user
    else
      redirect_to user_path(@user)
    end
  end

  def show
    @user = User.find(session[:user_id])
    redirect_to '/' if session[:user_id] != @user.id
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :company_id)
  end
end
