class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :destroy, :update, :edit]

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
      redirect_to office_path(@office), notice: "Booking was successfully created."
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

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to booking_path
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:office_id, :user_id, :booking_start, :booking_end)
  end
end
