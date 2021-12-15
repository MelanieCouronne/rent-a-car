class ReservationsController < ApplicationController

  def new
    @reservation = Reservation.new
  end

  def create
    @user = current_user
    @ride = Ride.find(params[:reservation][:ride_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.user = @user
    @reservation.ride = @ride
    if @reservation.save
      flash[:notice] = "This ride is booked!"
      redirect_to user_profile_path(@user)
    else
      flash[:alert] = "This ride is not valid."
      render :index
    end
  end

  def destroy
    @user = current_user
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:alert] = "This reservation is now delete."
    redirect_to user_profile_path(@user)
  end

  def user_reservations
    @user = current_user
    @reservations = Reservation.where(user: @user)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:reservation_passengers)
  end
end
