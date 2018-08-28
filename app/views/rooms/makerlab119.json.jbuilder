makerlab119_events = json.array!(@makerlab119_bookings) do |booking|
  json.id booking.id
  json.name booking.name
  json.title booking.event_name
  json.start booking.start_date
  json.end booking.end_date
  if booking.approved
    json.color '#2EFF85'
  else
    json.color '#ef5350'
  end
end

makerlab119_events
