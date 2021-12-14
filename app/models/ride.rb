class Ride < ApplicationRecord
  belongs_to :user
  has_many :reservations

  has_one_attached :photo

  validates :pickup_location, :checkout_location, :car_model, :car_brand, :rental_rate, presence: true
end
