class RidesController < ApplicationController
  before_action :set_params, only: :destroy

  include PgSearch::Model
  pg_search_scope :search_by_location_and_date,
    against: [ :pickup_location, :checkout_location, :pickup_datetime ],
    using: {
      tsearch: { prefix: true }
    }

  def index
    query = [params[:query]].join(' ').strip
    if !query.blank?
      @rides = Ride.search_by_location_and_date(query)
      # @rides = policy_scope(Ride).global_search(query)
    else
      @rides = Ride.all
    end
    # if params[:query].present?
    #   @rides = Ride.where("title ILIKE ?", "%#{params[:query]}%")
    # else
    #   @rides = Ride.all
    # end
    @ride = Ride.new
  end

  def new
    @ride = Ride.new
  end

  def create
    @ride = Ride.new(ride_params)
    @user = current_user
    @ride.user = @user
    if @ride.save
      redirect_to ride_path(@ride)
    else
      flash[:alert] = "This ride is not valid."
      render :new
    end
  end

  def destroy
  end

  def remaining_seats
    if passengers >= 1 && params[:reservation_passengers].to_i <= passengers
      @ride.passengers = params[:reservation_passengers].to_i
      @ride.save
    end
    redirect_to rides_path
  end

  private

  def set_ride
    @ride = Ride.find(params[:id])
  end

  def ride_params
    params.require(:ride).permit(:pickup_location, :checkout_location, :passengers, :car_model, :car_brand, :rental_rate, :pickup_datetime, :photo)
  end
end
