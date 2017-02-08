class SessionsController < ApplicationController
  skip_before_action :authorize_user, only: [:new,:demo, :create]

  def new
    @user = User.new
  end

  def demo
    @user = User.find(27)
    session[:user_id] = @user.id
    redirect_to @user
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:message] = "Incorrect Username or Password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end
