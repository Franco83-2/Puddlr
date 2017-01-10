class PuddlesController < ApplicationController
  before_action :authorize_user

  def index
  end

  def new
    @puddle = Puddle.new
  end

  def create
    @puddle = Puddle.new(puddle_params)
    new_driver = Driver.find_or_create_by(user_id: session[:user_id])
    @puddle.driver_id = new_driver.id
    if @puddle.save
      redirect_to @puddle
    else
      redirect_to new_puddle_path
    end
  end

  def edit
    @puddle = Puddle.find(:id)
  end

  def update
    @puddle = Puddle.where(driver_id: session[:user_id])
    if @puddle.update(:puddle_params)
      redirect_to @puddle
    else
      redirect_to puddle_path(@puddle)
    end
  end

  def show
    @puddle = Puddle.find(params[:id])
  end

  def destroy
  end

  private

  def puddle_params
    params.require(:puddle).permit(:departure_time, :seats, :distance)
  end
end
