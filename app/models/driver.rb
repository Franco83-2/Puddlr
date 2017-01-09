class Driver < ApplicationRecord
  belongs_to :user
  has_many :puddles
end
