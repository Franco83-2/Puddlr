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

end
