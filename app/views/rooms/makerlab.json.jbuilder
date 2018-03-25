makerlab_events = json.array!(@makerlab_bookings) do |booking|
  json.id booking.id
  json.name booking.name
  json.start booking.start_date
  json.end booking.end_date
  json.color '#ef5350'
end

makerlab_events
