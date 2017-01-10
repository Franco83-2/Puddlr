class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :authorize_user

  def current_user
    session[:user_id]
  end

  private

  def authorize_user
    unless logged_in?
      redirect_to signin_path
    end
  end

  def logged_in?
    !!session[:user_id]
  end

end
