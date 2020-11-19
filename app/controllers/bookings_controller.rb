class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:edit]

  before_action :find_booking, only: [:show, :destroy, :update, :edit, :accept, :reject]

  def index
    @bookings = Booking.all
  end

  def show
    authorize @booking
  end

  def create
    @office = Office.find(params[:office_id])
    @booking = Booking.new(booking_params)
    @booking.office = @office
    @booking.user = current_user
    authorize @booking
    if @booking.save!
      #change redirect to overview page of my bookings later, when it exists
      redirect_to myobnb_path, notice: "Booking was successfully created."
      # redirect_to office_path(@office), notice: "Booking was successfully created."
    else
      render :new
    end
  end

  def edit
    authorize @booking
  end

  def update
    authorize @booking
    @booking.update(booking_params)
    redirect_to booking_path(@booking.id), notice: 'Booking was successfully updated.'
  end

  def accept
    @booking.update(status: 'Accepted')
    redirect_to myobnb_path, notice: 'Booking accepted.'
  end
  
  def reject
    @booking.update(status: 'Rejected')
    redirect_to myobnb_path, notice: 'Booking rejected.'
  end  

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:office_id, :user_id, :booking_start, :booking_end)
  end
end
