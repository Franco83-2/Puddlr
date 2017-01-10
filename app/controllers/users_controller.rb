class UsersController < ApplicationController
  before_action :authorize_user

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to @user
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(session[:user_if])
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
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
