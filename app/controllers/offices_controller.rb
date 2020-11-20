class OfficesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show corporate_index startup_index private_owner_index pets_allowed_index]
  skip_after_action :verify_authorized, only: %i[corporate_index startup_index private_owner_index pets_allowed_index]

  before_action :find, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      # sql_query = "address_zip @@ :query OR address_city @@ :query OR address_street @@ :query"
      # @offices = Office.where(sql_query, query: "%#{params[:query]}%")
      @offices = Office.search_by_address_city_zip_street(params[:query])
    else
      @offices = Office.all
    end
    @markers = @offices.geocoded.map do |office|
      {
        lat: office.latitude,
        lng: office.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { office: office })
      }
    end
  end

  def corporate_index
    @corporate_offices = Office.where(cat_corporate: true)
    @markers = @corporate_offices.geocoded.map do |office|
      {
        lat: office.latitude,
        lng: office.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { office: office })
      }
    end
  end

  def startup_index
    @startup_offices = Office.where(cat_startup: true)
    @markers = @startup_offices.geocoded.map do |office|
      {
        lat: office.latitude,
        lng: office.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { office: office })
      }
    end
  end

  def private_owner_index
    @private_owner_offices = Office.where(cat_private_owner: true)
    @markers = @private_owner_offices.geocoded.map do |office|
      {
        lat: office.latitude,
        lng: office.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { office: office })
      }
    end
  end

  def pets_allowed_index
    @pets_allowed_offices = Office.where(pets_allowed: true)
    @markers = @pets_allowed_offices.geocoded.map do |office|
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
    if @office.geocoded?
      @marker = [{
        lat: @office.latitude,
        lng: @office.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { office: @office })
      }]
    end
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
    params.require(:office).permit(
      :office_name, :description, :address_street, :address_zip, :address_city,
      :rate_per_day, :table_num, :placehold_url, :drinks, :snacks, :social_events, :community_slack, :pets_allowed,
      :night_shift, :community_manager, :outdoor_area, :smoking_area, :cat_open_space, :cat_single_space,
      :cat_corporate, :cat_startup, :cat_private_owner, :cat_skyscraper, :cat_city, :cat_rural, :cat_boutique,
      :cat_black_lable, :photo
    )
  end

  def find
    @office = Office.find(params[:id])
  end
end


