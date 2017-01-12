class CarsController < ApplicationController
  before_action :authorize_user

  def index
    @cars = Car.where(user_id: session[:user_id])
  end

  def new
    @car = Car.new
    @user = User.find(current_user)
  end

  def create
    @car = Car.new(car_params)
    @user = User.find(current_user)
    @car.user_id = current_user
    if @car.save
      redirect_to user_car_path(session[:user_id], @car.id)
    else
      render :new
    end
  end

  def edit
    @user = User.find(current_user)
    if current_user == params[:user_id].to_i
      @car = Car.find(params[:id])
    else
      redirect_to user_path(session[:user_id])
    end
  end

  def update
    @car = Car.find(params[:id])
      if @car.update(car_params)
        redirect_to user_car_path(session[:user_id], @car)
      else
        redirect_to edit_user_car_path(@user)
      end
  end

  def show
    @user = User.find(current_user)
    @car = @user.cars.find(params[:id])
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to user_cars_path(current_user)
  end

  private

  def car_params
    params.require(:car).permit(:make, :model, :year, :color)
  end
end
