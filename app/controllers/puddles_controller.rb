class PuddlesController < ApplicationController
  before_action :authorize_user

  def index
    @puddles = Puddle.where("departure_time > ?", DateTime.now).order(departure_time: :asc)
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
    find_puddle
    @user = User.find(session[:user_id])
  end

  def add_passenger
    find_puddle
    if @puddle.valid? && @puddle.seats != 0
      new_passenger = Passenger.find_or_create_by(user_id: session[:user_id])
      PuddlePassenger.create(passenger_id: new_passenger.id, puddle_id: @puddle.id)
      @puddle.seats -= 1
      @puddle.save
      flash[:message] = "You have been added to this Puddle."
      redirect_to @puddle
    else
      redirect_to add_passenger_path
    end
  end

    def remove_passenger
      find_puddle
        @passenger = Passenger.find_by(user_id: session[:user_id])
        PuddlePassenger.find_by(puddle_id: @puddle.id, passenger_id: @passenger.id).destroy
        @puddle.seats += 1
        @puddle.save
        flash[:message] = "You have left this Puddle."
        redirect_to @puddle
    end



  def destroy
    find_puddle
      PuddlePassenger.where(puddle_id: @puddle.id).destroy_all
      @puddle.destroy
      redirect_to user_path
  end

  private

  def find_puddle
    @puddle = Puddle.find(params[:id])
  end

  def puddle_params
    params.require(:puddle).permit(:departure_time, :seats, :distance)
  end
end
