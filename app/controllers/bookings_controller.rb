class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
    @makerspace_bookings = Booking.where(location: Booking.locations[:makerspace])
    @makerlab_bookings = Booking.where(location: Booking.locations[:makerlab])
    @makerlounge_bookings = Booking.where(location: Booking.locations[:makerlounge])
    @brunsfield_bookings = Booking.where(location: Booking.locations[:brunsfield])
    gon.jbuilder template: 'app/views/bookings/index.json.jbuilder', as: :bookings
  end

  def create
    @booking = Booking.new(booking_params)
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

  def show
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:name, :email, :event_name, :location, :start_date, :end_date)
  end
end
