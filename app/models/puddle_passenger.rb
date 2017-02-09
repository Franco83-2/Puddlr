class PuddlePassenger < ApplicationRecord
  belongs_to :passenger
  belongs_to :puddle
  validates_uniqueness_of :passenger_id, :scope => :puddle_id
  validate :seats_available
  validate :passenger_is_not_driver

  def seats_available
    errors.add(:puddlepassenger, "There are not enough seats availavle") unless Puddle.find(puddle_id).seats > 0
  end

  def passenger_is_not_driver
    errors.add(:puddlepassenger, "The driver can not be a passenger") unless puddle.driver.user != passenger.user
  end



  #Need custom validator to check puddle number of seats available for adding a passenger.
  #Need to check that passenger is not driver.
end
