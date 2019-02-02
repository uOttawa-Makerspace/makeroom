class Booking < ApplicationRecord
  belongs_to :user

  validates :start_date,
    presence: { message: "Please select a start date." }
  validates :end_date,
    presence: { message: "Please select a end date." }
  validates :name,
    presence: { message: "Please provide a name." }
  validates :email,
    presence: { message: "Please provide an email." }
  validates :event_name,
    presence: { message: "Please provide an event name." }
  validates :location, presence: true

  validates :frequency,
    presence: {message: "Please provide the frequency"}, if: :repeating?

  validates :anchor,
    presence: {message: "Please provide the anchor date"}, if: :repeating?


  enum location: %i[makerspace makerlab119 makerlab121 sandbox mill1 lathe1 lathe2 welding1 welding2 trailer stem124 stem126 assembly_area]
  enum frequency: {Never: 0, Daily: 1, Weekly: 2, Biweekly: 3, Monthly: 4, Annually: 5}
  def date_humanize
    start = I18n.l start_date, format: :short if start_date.present?
    end_time = I18n.l end_date, format: :short if start_date.present?
    start + " - " + end_time
  end

  def self.location_list
    {
      makerspace: "Makerspace",
      makerlab119: "Makerlab 119",
      makerlab121: "Makerlab 121",
      sandbox: "Sandbox",
      mill1: "Mill 1",
      lathe1: "Lathe 1",
      lathe2: "Lathe 2",
      welding1: "Welding 1",
      welding2: "Welding 2",
      trailer: "CEED Trailer",
      stem124: "STEM 124",
      stem126: "STEM 126",
      assembly_area: "Assembly Area"
    }
  end

  def location_humanize
    all_locations_list = {
      makerspace: "Makerspace",
      makerlab119: "Makerlab 119",
      makerlab121: "Makerlab 121",
      sandbox: "Sandbox",
      mill1: "Mill 1",
      lathe1: "Lathe 1",
      lathe2: "Lathe 2",
      welding1: "Welding 1",
      welding2: "Welding 2",
      trailer: "CEED Trailer",
      stem124: "STEM 124",
      stem126: "STEM 126",
      assembly_area: "Assembly Area"

    }
    all_locations_list[location.to_sym]
  end

  def repeating?
    self.repeat
  end
  def schedule(start)
    @schedule ||= begin
      schedule = IceCube::Schedule.new(start)
      case frequency
      when 'Never'
        self.repeat = false
      when 'Daily'
        schedule.add_recurrence_rule IceCube::Rule.daily
      when 'Weekly'
        schedule.add_recurrence_rule IceCube::Rule.weekly(1)
      when 'Biweekly'
        schedule.add_recurrence_rule IceCube::Rule.weekly(2)
      when 'Monthly'
        schedule.add_recurrence_rule IceCube::Rule.monthly(1)
      when 'Annually'
        schedule.add_recurrence_rule IceCube::Rule.yearly(1)
      end
      schedule
    end
  end

  def calendar_event
    if !repeat
      [self]
    else
      start_frequency = self.start_date.to_date
      end_frequency = self.until_date
      schedule(start_frequency).occurrences(end_frequency).map do |date|
        Booking.new(id: id, name: name, email: email, event_name: event_name, location: location, start_date: self.start_date.change(year: date.year, month: date.month, day: date.day),
        end_date: self.end_date.change(year: date.year, month: date.month, day: date.day), approved: approved, user_id: user_id)
      end
    end
  end

end
