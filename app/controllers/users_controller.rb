class UsersController < ApplicationController

# which are my offices
# which are my bookings for each office
  def host_index
    # user_id = current_user
    @offices = Office.where(user: current_user)
    authorize @offices
    # @bookings = Booking.where(user: current_user).
    #   where(office_id: @offices)
     @bookings = Booking.where(user: current_user)
      # , office_id: '@offices')
  end

  # def index
  #   @user = current_user
  # end

# which bookings do u have where and when as a customer

end

# Comment.
#   where(:created_at => time_range).
#   where("user_id is not in (?)",[user_ids])
