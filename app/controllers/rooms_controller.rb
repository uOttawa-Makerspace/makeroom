class RoomsController < ApplicationController
  def makerspace
    @current_user = current_user
    @makerspace_bookings = Booking.where(location: Booking.locations[:makerspace])
  end

  def makerlab119
    @current_user = current_user
    @makerlab119_bookings = Booking.where(location: Booking.locations[:makerlab119])
  end

  def makerlab121
    @current_user = current_user
    @makerlab121_bookings = Booking.where(location: Booking.locations[:makerlab121])
  end

  def mill1
    @current_user = current_user
    @mill1_bookings = Booking.where(location: Booking.locations[:mill1])
  end

  def lathe1
    @current_user = current_user
    @lathe1_bookings = Booking.where(location: Booking.locations[:lathe1])
  end

  def lathe2
    @current_user = current_user
    @lathe2_bookings = Booking.where(location: Booking.locations[:lathe2])
  end

  def welding1
    @current_user = current_user
    @welding1_bookings = Booking.where(location: Booking.locations[:welding1])
  end

  def welding2
    @current_user = current_user
    @welding2_bookings = Booking.where(location: Booking.locations[:welding2])
  end

  def sandbox
    @current_user = current_user
    @sandbox_bookings = Booking.where(location: Booking.locations[:sandbox])
  end

  def trailer
    @current_user = current_user
    @trailer_bookings = Booking.where(location: Booking.locations[:trailer])
  end

end
