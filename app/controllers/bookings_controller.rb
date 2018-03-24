class BookingsController < ApplicationController
  def index
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.end_date = (@booking.start_date + 1.hours).to_datetime if !@booking.end_date.nil?
    if @booking.save
      redirect_to bookings_path
    else
      render 'new'
    end
  end

  def booking_params
    params.require(:booking).permit(:name, :email, :event_name, :location, :start_date, :end_date)
  end
end
