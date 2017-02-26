class User < ApplicationRecord
  belongs_to :company
  has_many :locations, through: :company
  has_many :drivers
  has_many :puddles, through: :drivers
  has_many :passengers
  has_many :puddles, through: :passengers
  has_many :profiles
  has_many :cars
  has_secure_password

  validates :email,
    uniqueness: true,
    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :password,
    presence: true,
    confirmation: true,
    length: { in: 6..24 }

end
