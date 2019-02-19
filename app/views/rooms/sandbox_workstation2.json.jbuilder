sandbox_workstation2_events = json.array!(@sandbox_workstation2_bookings) do |booking|
  json.id booking.id
  json.username booking.user.username
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

sandbox_workstation2_events
