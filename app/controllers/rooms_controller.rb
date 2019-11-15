class RoomsController < ApplicationController
  def makerspace
    @current_user = current_user
    @makerspace_bookings = Booking.where(location: Booking.locations[:makerspace]).flat_map{ |e| e.calendar_event}
  end

  def makerlab119
    @current_user = current_user
    @makerlab119_bookings = Booking.where(location: Booking.locations[:makerlab119]).flat_map{ |e| e.calendar_event}
  end

  def makerlab121
    @current_user = current_user
    @makerlab121_bookings = Booking.where(location: Booking.locations[:makerlab121]).flat_map{ |e| e.calendar_event}
  end

  def mill1
    @current_user = current_user
    @mill1_bookings = Booking.where(location: Booking.locations[:mill1]).flat_map{ |e| e.calendar_event}
  end

  def lathe1
    @current_user = current_user
    @lathe1_bookings = Booking.where(location: Booking.locations[:lathe1]).flat_map{ |e| e.calendar_event}
  end

  def lathe2
    @current_user = current_user
    @lathe2_bookings = Booking.where(location: Booking.locations[:lathe2]).flat_map{ |e| e.calendar_event}
  end

  def welding1
    @current_user = current_user
    @welding1_bookings = Booking.where(location: Booking.locations[:welding1]).flat_map{ |e| e.calendar_event}
  end

  def welding2
    @current_user = current_user
    @welding2_bookings = Booking.where(location: Booking.locations[:welding2]).flat_map{ |e| e.calendar_event}
  end

  def sandbox
    @current_user = current_user
    @sandbox_bookings = Booking.where(location: Booking.locations[:sandbox]).flat_map{ |e| e.calendar_event}
  end

  def sandbox_workstation1
    @current_user = current_user
    @sandbox_workstation1_bookings = Booking.where(location: Booking.locations[:sandbox_workstation1]).flat_map{ |e| e.calendar_event}
  end

  def sandbox_workstation2
    @current_user = current_user
    @sandbox_workstation2_bookings = Booking.where(location: Booking.locations[:sandbox_workstation2]).flat_map{ |e| e.calendar_event}
  end

  def sandbox_workstation3
    @current_user = current_user
    @sandbox_workstation3_bookings = Booking.where(location: Booking.locations[:sandbox_workstation3]).flat_map{ |e| e.calendar_event}
  end

  def trailer
    @current_user = current_user
    @trailer_bookings = Booking.where(location: Booking.locations[:trailer]).flat_map{ |e| e.calendar_event}
  end

  def assembly_area
    @current_user = current_user
    @assembly_area_bookins = Booking.where(location: Booking.locations[:assembly_area]).flat_map{ |e| e.calendar_event}
  end
  def stem124
    @current_user = current_user
    @stem124_bookings = Booking.where(location: Booking.locations[:stem124]).flat_map{ |e| e.calendar_event}
  end

  def stem126
    @current_user = current_user
    @stem126_bookings = Booking.where(location: Booking.locations[:stem126]).flat_map{ |e| e.calendar_event}
  end

  def composite_room
    @current_user
    @composite_room_bookings = Booking.where(location: Booking.locations[:composite_room]).flat_map{ |e| e.calendar_event}
  end

end
