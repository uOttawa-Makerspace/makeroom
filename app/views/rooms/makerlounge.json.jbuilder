makerlounge_events = json.array!(@makerlounge_bookings) do |booking|
  json.id booking.id
  json.name booking.name
  json.title booking.event_name
  json.start booking.start_date
  json.end booking.end_date
  json.color '#ef5350'
end

makerlounge_events
