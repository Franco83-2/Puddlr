class PuddlePassenger < ApplicationRecord
  belongs_to :passenger
  belongs_to :puddle
end
