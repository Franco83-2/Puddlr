class DriversController < ApplicationController

  def driver_remove_passenger
    find_puddle
    @passenger = Passenger.find_by(user_id: params[:passenger_user_id])
    PuddlePassenger.find_by(puddle_id: @puddle.id, passenger_id: @passenger.id).destroy
    @puddle.seats += 1
    @puddle.save
    flash[:message] = "Passenger has been removed from the puddle."
    redirect_to @puddle
  end

  private
  def find_puddle
    @puddle = Puddle.find(params[:id])
  end

end
