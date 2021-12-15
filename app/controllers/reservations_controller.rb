class ReservationsController < ApplicationController

  def new
    @reservation = Reservation.new
    @ride = Ride.find(params[:ride_id])
    @user = current_user
  end

  def create
    @user = current_user
    @ride = Ride.find(params[:ride_id])
    @reservation = Reservation.new(reservation_passengers: 1, user_id: 1, ride_id: 2)
    @reservation.user = @user
    @reservation.ride = @ride
    if @reservation.save
      flash[:notice] = "This reservation was successfully created!"
      redirect_to my_reservations_user_path(current_user)
    else
      flash[:alert] = "This reservation is not valid."
      redirect_to ride_path(@ride)
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:alert] = "This reservation is now delete."
    redirect_to user_profile_path(@user)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:reservation_passengers, :user_id, :ride_id)
  end
end
