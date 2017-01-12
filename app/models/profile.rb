class Profile < ApplicationRecord
      belongs_to :user
      validates :name, presence: true, length: { maximum: 50 }
      validates :address, presence: true, length: { maximum: 100 }
      validates :phone, length: { is: 10 }
      validates :user_id, uniqueness: true
end
