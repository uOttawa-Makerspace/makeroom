class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.end_date = (@booking.start_date + 1.hours).to_datetime if @booking.end_date.nil?
    @booking.approved = false
    if @booking.save
      redirect_to bookings_path
    else
      render 'new'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  def booking_params
    params.require(:booking).permit(:name, :email, :event_name, :location, :start_date)
  end
end
