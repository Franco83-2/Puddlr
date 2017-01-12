class Car < ApplicationRecord
  belongs_to :user
  validates :make, :model, :year, :color, presence: true
end
