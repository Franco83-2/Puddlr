class Puddle < ApplicationRecord
  belongs_to :driver
  has_many :puddle_passengers
  has_many :passengers, through: :puddle_passengers


  def passenger_list
    self.passengers.joins(user: :profiles).pluck(:name)
  end

  def driver_name
    self.driver.user.profiles.first.name
  end

  def driver_phone
    self.driver.user.profiles.first.phone
  end

  def driver_address
    self.driver.user.profiles.first.address
  end

  def driver_info
    results = []
    results << driver_name
    results << driver_address
    results << driver_phone
    results
  end

end
