class Puddle < ApplicationRecord
  belongs_to :driver
  has_many :puddle_passengers
  has_many :passengers, through: :puddle_passengers
end
