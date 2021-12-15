class UsersController < ApplicationController

  def profile
    @user = current_user
  end

  def my_rides
    @user = current_user
    @rides = @user.rides
  end

  def my_reservations
    @user = current_user
    @reservations = @user.reservations
  end

  private

  def article_params
    params.require(:user).permit(:last_name, :first_name, :photo)
  end

end
