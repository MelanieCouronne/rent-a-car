class RidesController < ApplicationController
  before_action :set_ride, only: [:show, :destroy, :remaining_seats]
  before_action :remaining_seats

  def index
    query = [params[:query]].join(' ').strip
    if query.blank?
      @rides = Ride.all
    else
      @rides = Ride.search_by_location_and_date(query)
    end
  end

  def new
    @ride = Ride.new
  end

  def create
    @ride = Ride.new(ride_params)
    @user = current_user
    @ride.user = @user

    if @ride.save
      redirect_to rides_path
    else
      flash[:alert] = "This ride is not valid. Please try again."
      render :new
    end

  end

  def show
  end

  def destroy
    @user = current_user
    @ride.user = @user
    @ride.destroy
    flash[:notice] = "Your ride is deleted"
    redirect_to my_rides_user_path(@user)
  end


  private

  def remaining_seats
    results = 0
    @rides = Ride.all
    @rides.each do |ride|
      ride.reservations.each do |reservation|
        results += reservation.reservation_passengers
        ride.passengers_update = ride.passengers - results
        ride.save
      end
    end
  end

  def set_ride
    @ride = Ride.find(params[:id])
  end

  def ride_params
    params.require(:ride).permit(:pickup_location, :checkout_location, :passengers, :car_model, :car_brand, :rental_rate, :pickup_datetime, :photo)
  end
end
