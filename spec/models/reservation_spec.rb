require 'rails_helper'


RSpec.describe Reservation, type: :model do
  ride = Ride.create!(user_id: 10,
                  pickup_location: "Bordeaux",
                  checkout_location: "Lyon",
                  car_model: "Sandero III",
                  car_brand: "Dacia",
                  rental_rate: 4)


  subject {
    described_class.new(user_id: 10, ride_id: ride.id)
  }

  context "Associations" do
    it { should belong_to(:ride).without_validating_presence}
    it { should belong_to(:user).without_validating_presence}
  end

  context "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without user id" do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without ride id" do
      subject.ride_id = nil
      expect(subject).to_not be_valid
    end
  end
end
