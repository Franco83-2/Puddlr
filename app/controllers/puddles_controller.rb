class PuddlesController < ApplicationController
  before_action :authorize_user

  def index
    @puddles = Puddle.all
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
    @user = User.find(session[:user_id])
  end

  def add_passenger
    @puddle = Puddle.find(params[:id])
    if @puddle.save
      new_passenger = Passenger.find_or_create_by(user_id: session[:user_id])
      PuddlePassenger.create(passenger_id: new_passenger.id, puddle_id: @puddle.id)
      @puddle.seats -= 1
      @puddle.save
      redirect_to @puddle
    else
      redirect_to add_passenger_path
    end
  end

  def destroy
  end

  private

  def puddle_params
    params.require(:puddle).permit(:departure_time, :seats, :distance)
  end
end
