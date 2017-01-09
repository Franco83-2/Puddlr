class Puddle < ApplicationRecord
  belongs_to :driver
  has_many :puddle_passengers
  has_many :passengers, through: :puddle_passengers


  def passenger_list
    self.passengers.joins(user: :profiles).pluck(:name)
  end

end
