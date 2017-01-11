class CarsController < ApplicationController
  before_action :authorize_user

  def index
    @cars = Car.where(user_id: session[:user_id])
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user_id = session[:user_id]
    if @car.save
      redirect_to @car
    else
      redirect_to new_car_path
    end
  end

  def edit
    if session[:user_id] == params[:id].to_i
      @car = Car.find(params[:id])
    else
      redirect_to user_path(session[:user_id])
    end
  end

  def update
    @car = Car.find(params[:id])
      if @car.update(car_params)
        redirect_to @car
      else
        redirect_to edit_car_path
      end
  end

  def show
    @car = Car.find(params[:id])
  end

  private

  def car_params
    params.require(:car).permit(:make, :model, :year, :color)
  end
end
