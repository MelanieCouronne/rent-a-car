class Ride < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservation

end
