class OfficesController < ApplicationController
  before_action :find, only: %i[show edit update destroy]

  def index
    @offices = Office.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @office = Office.new
  end

  def create
    @office = Office.new(office_params)
    @office.user = current_user # given to every controller by devise (does not need to be declared)
    if @office.save
      redirect_to office_path(@office)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @office.update(office_params)
    redirect_to office_path(@office.id), notice: 'Office was successfully updated.'
  end

  def destroy
    @office.destroy
    redirect_to office_path
  end

  private

  def office_params
    params.require(:office).permit(:name, :description, :address, :price, :availability_description, :table_num, :wifi, :amenities)
  end

  def find
    @office = Office.find(params[:id])
  end
end
