class User < ApplicationRecord
  belongs_to :location
  has_many :drivers
  has_many :puddles, through: :drivers
  has_many :passengers
  has_many :puddles, through: :passengers
  has_many :profiles
  has_many :cars
  has_secure_password
end
