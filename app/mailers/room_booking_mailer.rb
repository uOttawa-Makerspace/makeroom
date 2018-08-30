class RoomBookingMailer < ApplicationMailer
  def new_booking_notification(booking , email)
    @booking = booking
    @email = email
    @location = booking.location_humanize
    @url = "http://makerroom.herokuapp.com"
    mail(to: @email, subject: "Makeroom - New booking pending approval")
  end

  def booking_confirmation(booking)
    @email = booking.email
    @name = booking.name
    @event_name = booking.name
    @location = booking.location_humanize
    @url = "http://makerroom.herokuapp.com"
    @start_date = booking.start_date
    @end_date = booking.end_date
    @repeat = booking.repeat
    @frequency = booking.frequency
    @until_date = booking.until_date

    mail(to: @email, subject: "Makeroom - Your booking has been placed")
  end


  def booking_approved(booking)
    @booking = booking
    @email = booking.email
    @name = booking.name
    @event_name = booking.name
    @location = booking.location_humanize
    @start_date = booking.start_date
    @end_date = booking.end_date
    @repeat = booking.repeat
    @frequency = booking.frequency
    @until_date = booking.until_date
    mail(to: @email, subject: "Makeroom - Your booking request has been accepted.")

  end
end
