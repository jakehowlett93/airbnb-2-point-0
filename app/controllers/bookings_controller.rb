class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :destroy]

  def new # Louis
    @booking = Booking.new
  end

  def create # Louis
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.property_id = params[:property_id]
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render properties_path(params[:property_id])
    end
  end


  def show # Yunus
  end

  def edit # Alex
  end

  def update # Alex
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def index # Jake
  end

  def destroy # Yunus
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_cost, :price_per_night, :number_of_guests,
                                    :status)
  end
end