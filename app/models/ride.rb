class Ride < ApplicationRecord
  include PgSearch::Model

  belongs_to :user
  has_many :reservations

  has_one_attached :photo

  validates :pickup_location, :checkout_location, :car_model, :car_brand, :rental_rate, presence: true

  pg_search_scope :search_by_location_and_date,
    against: [ :pickup_location, :checkout_location, :pickup_datetime ],
    using: {
      tsearch: { prefix: true }
    }
end
