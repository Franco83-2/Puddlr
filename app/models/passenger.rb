class Passenger < ApplicationRecord
  belongs_to :user
  has_many :puddle_passengers
  has_many :puddles, through: :puddle_passengers

  def puddles_taken
    puddles.where("departure_time < ?", DateTime.now).count
  end

  def favorite_driver
  end

end
