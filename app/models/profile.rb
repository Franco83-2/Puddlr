class Profile < ApplicationRecord
      belongs_to :user
      validates :name, presence: true
      validates :address, presence: true
      validates :phone, length: { is: 10 }
end
