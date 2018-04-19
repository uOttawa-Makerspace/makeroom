class RoomsController < ApplicationController
  def makerspace
    @makerspace_bookings = Booking.where(location: Booking.locations[:makerspace])
  end

  def makerlab
    @makerlab_bookings = Booking.where(location: Booking.locations[:makerlab])
  end

  def makerlounge
    @makerlounge_bookings = Booking.where(location: Booking.locations[:makerlounge])
  end

  def brunsfield
    @brunsfield_bookings = Booking.where(location: Booking.locations[:brunsfield])
  end

  def sandbox
    @sandbox_bookings = Booking.where(location: Booking.locations[:sandbox])
  end
end
