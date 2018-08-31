class BookingsController < ApplicationController
  def index
    if current_user && current_user.admin?
      @bookings = Booking.all.order("id DESC").paginate(page: params[:page], per_page: 10)
    else
      redirect_to root_path
    end
  end

  def new
    @booking = Booking.new
    if params[:location] == "makerspace"
      @makerspace_bookings = Booking.where(location: Booking.locations[:makerspace]).flat_map{ |e| e.calendar_event}
    elsif params[:location] == "makerlab119"
      @makerlab119_bookings = Booking.where(location: Booking.locations[:makerlab119]).flat_map{ |e| e.calendar_event}
    elsif params[:location] == "makerlab121"
      @makerlab121_bookings = Booking.where(location: Booking.locations[:makerlab121]).flat_map{ |e| e.calendar_event}
    elsif params[:location] == "mill1"
      @mill1_bookings = Booking.where(location: Booking.locations[:mill1]).flat_map{ |e| e.calendar_event}
    elsif params[:location] == "lathe1"
      @lathe1_bookings = Booking.where(location: Booking.locations[:lathe1]).flat_map{ |e| e.calendar_event}
    elsif params[:location] == "lathe2"
      @lathe2_bookings = Booking.where(location: Booking.locations[:lathe2]).flat_map{ |e| e.calendar_event}
    elsif params[:location] == "welding1"
      @welding1_bookings = Booking.where(location: Booking.locations[:welding1]).flat_map{ |e| e.calendar_event}
    elsif params[:location] == "welding2"
      @welding2_bookings = Booking.where(location: Booking.locations[:welding2]).flat_map{ |e| e.calendar_event}
    elsif params[:location] == "sandbox"
      @sandbox_bookings = Booking.where(location: Booking.locations[:sandbox]).flat_map{ |e| e.calendar_event}
    elsif params[:location] == "trailer"
      @trailer_bookings = Booking.where(location: Booking.locations[:trailer]).flat_map{ |e| e.calendar_event}
    elsif params[:location] == "stem124"
      @stem124_bookings = Booking.where(location: Booking.locations[:stem124]).flat_map{ |e| e.calendar_event}
    elsif params[:location] == "stem126"
      @stem126_bookings = Booking.where(location: Booking.locations[:stem126]).flat_map{ |e| e.calendar_event}
    end

    @booking[:location] = params[:location]
    @location = params[:location]
    gon.jbuilder template: 'app/views/bookings/index.json.jbuilder', as: :bookings
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.repeating? && @booking[:start_date].present?
      @booking[:anchor] = @booking[:start_date].to_date.to_s
    end
    @booking.user_id = current_user.id
    @booking.approved = false

    if @booking.location == "makerspace"
      @email = "makerspace@uOttawa.ca"
    elsif @booking.location == "makerlab119" || @booking.location == "makerlab121"
      @email = "makerlab@uOttawa.ca"
    elsif @booking.location == "mill1" || @booking.location == "lathe1" || @booking.location == "lath2" || @booking.location == "welding1" || @booking.location == "welding2"
      @email = "brunsfield@uOttawa.ca"
    elsif @booking.location == "sandbox"
      @email = "sandbox@uOttawa.ca"
    else
      @email = "Emilie.Salinas@uottawa.ca"
    end

    if @booking.save
      RoomBookingMailer.new_booking_notification(@booking, @email).deliver_now
      RoomBookingMailer.booking_confirmation(@booking).deliver_now
      flash[:notice] = "Event created successfully!"
      redirect_to root_path
    else
      flash[:error] = "Could not save the event. Please make sure to provide all the required information."
      redirect_to new_booking_path(:location => @booking.location)
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
      RoomBookingMailer.booking_approved(@booking).deliver_now
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
    params.require(:booking).permit(:name, :email, :event_name, :location, :start_date, :end_date, :repeat, :frequency, :anchor, :until_date)
  end
end
