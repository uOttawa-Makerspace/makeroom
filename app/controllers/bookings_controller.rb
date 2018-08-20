class BookingsController < ApplicationController
  def index
    @bookings = Booking.all.order("id DESC").paginate(page: params[:page], per_page: 10)
  end

  def new
    @booking = Booking.new
    @makerspace_bookings = Booking.where(location: Booking.locations[:makerspace])
    @makerlab_bookings = Booking.where(location: Booking.locations[:makerlab])
    @makerlounge_bookings = Booking.where(location: Booking.locations[:makerlounge])
    @brunsfield_bookings = Booking.where(location: Booking.locations[:brunsfield])
    @sandbox_bookings = Booking.where(location: Booking.locations[:sandbox])
    @locations = Booking.location_list.map {|k,v| [v,k]}

    if current_user.role == 'brunsfield'
      @locations = [["Brunsfield",'brunsfield']]
    elsif current_user.role == 'sandbox'
      @locations = [["Sandbox",'sandbox']]
    end
    gon.jbuilder template: 'app/views/bookings/index.json.jbuilder', as: :bookings
  end

  def create
    @booking = Booking.new(booking_params)
    if current_user.role == 'brunsfield' || current_user.role == 'sandbox'
      @booking.approved = true
    else
      @booking.approved = false
    end
    if @booking.save
      redirect_to bookings_path
    else
      redirect_to new_booking_path
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

  def approve
    @booking = Booking.find(params[:id])
    @booking.approved = true
    if @booking.save
      redirect_to bookings_path
    else
      redirect_to bookings_path
    end
  end

  def disapprove
    @booking = Booking.find(params[:id])
    @booking.approved = false
    if @booking.save
      redirect_to bookings_path
    else
      redirect_to bookings_path
    end
  end

  def update
    if @booking.update(booking_params)
      flash[:notice] = "Booking updated successfully."
      redirect_to bookings_path
    else
      flash[:alert] = "Could not save changes."
      redirect_to bookings_path
    end
  end

private
  def booking_params
    params.require(:booking).permit(:name, :email, :event_name, :location, :start_date, :end_date)
  end
end
