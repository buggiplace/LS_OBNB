class BookingsController < ApplicationController
    before_action :find_booking, only: [:show, :destroy, :update, :edit]
    def index
        @bookings = Bookings.all
    end   
    
    def show
    end

    def new
        @office = Office.find(params[:office_id])
        @booking = Booking.new
    end

    def create
        @office = Office.find(params[:office_id])
        @booking = Booking.new(booking_params)
        @booking.office = @office
        if @booking.save!
          redirect_to office_path(@office), notice: ‘Booking was successfully created.’
        else
          render :new
        end
    end

    def edit
    end
  
    def update
      @booking.update(booking_params)
      redirect_to booking_path(@booking.id), notice: 'Booking was successfully updated.'
    end

    def destroy
        @booking.destroy
        redirect_to booking_path
      end

    private
    def find_booking
        @booking = Booking.find(params[:id])
    end
    def booking_params
        params.require(@booking).permit(:office_id, :user_id, :booking_start, :booking_end)
    end
    
end

