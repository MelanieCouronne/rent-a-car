require 'rails_helper'


RSpec.describe Ride, type: :model do
  #refacto

  # new_user = User.create!(email:"melanie@gmail.com", password: "azerty")
  melanie = User.find_by(email:"melanie@gmail.com")

  subject {
    described_class.new(user_id: melanie.id,
                        pickup_location: "Bordeaux",
                        checkout_location: "Lyon",
                        car_model: "Sandero III",
                        car_brand: "Dacia",
                        rental_rate: 4)
  }

  context "Associations" do
    it { should belong_to(:user).without_validating_presence}
    it { should have_many(:reservations).without_validating_presence}
  end

  context "Validations" do
    it "is valid with valid attributes" do
      # ride = Ride.new(user_id: new_user.id, pickup_location: "Bordeaux", checkout_location: "Lyon", car_model: "Sandero III", car_brand: "Dacia", rental_rate: 4)

      expect(subject).to be_valid
    end

    it "is not valid without a pickup location" do
      # ride = Ride.new(pickup_location: nil)
      # refacto
      subject.pickup_location = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a checkout location" do
      # ride = Ride.new(checkout_location: nil)

      # refacto
      subject.checkout_location = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a car model" do
      # ride = Ride.new(car_model: nil)

      # refacto
      subject.car_model = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a car brand" do
      ride = Ride.new(car_brand: nil)

      # refacto
      subject.car_brand = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a rental rate" do
      ride = Ride.new(rental_rate: nil)

      # refacto
      subject.rental_rate = nil
      expect(subject).to_not be_valid
    end
  end
end
