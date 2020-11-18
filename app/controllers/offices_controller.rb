class OfficesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  before_action :find, only: %i[show edit update destroy]

  def index
    @offices = Office.all
    @markers = @offices.geocoded.map do |office|
      {
        lat: office.latitude,
        lng: office.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { office: office })
      }
    end
  end

  def show
    authorize @office
    @booking = Booking.new
  end

  def new
    @office = Office.new
    authorize @office
  end

  def create
    @office = Office.new(office_params)
    authorize @office
    @office.user = current_user # given to every controller by devise (does not need to be declared)
    if @office.save
      redirect_to office_path(@office), notice: 'Office was successfully created.'
    else
      render :new
    end
  end

  def edit
    authorize @office
  end

  def update
    authorize @office
    if @office.update(office_params)
      redirect_to office_path(@office.id), notice: 'Office was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @office
    @office.destroy
    redirect_to office_path, notice: 'Office was successfully destroyed.'
  end

  private

  def office_params
    params.require(:office).permit(:name, :description, :address, :price, :availability_description, :table_num, :wifi, :amenities, :photo)
  end

  def find
    @office = Office.find(params[:id])
  end
end
