class Driver < ApplicationRecord
  belongs_to :user
  has_many :puddles

  def self.most_puddles
    #returns driver id and number of puddles as a driver as an array [x,y]
    Puddle.group(:driver_id).order('driver_id desc').count('id').first
  end

  def self.most_puddles_driver_name
    Driver.find(most_puddles[0]).user.profiles.first.name
  end

  def self.most_puddles_count
    most_puddles[1]
  end

  def driven_puddles
    #number of puddles driven by a user as a driver
    puddles.where("departure_time < ?", DateTime.now).count
  end

  def total_seats
    puddles.where("departure_time < ?", DateTime.now).sum(:seats)
  end

  def total_passengers
    puddles.joins(:puddle_passengers).where("departure_time < ?", DateTime.now).count
  end

  def butts_to_seats_ratio
    (total_passengers.to_f / total_seats.to_f).round(3) * 100
  end

  def upcoming_puddles
   self.puddles.where("departure_time > ?", DateTime.now)
  end

end
