class Booking < ApplicationRecord
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :name, presence: true
  validates :email, presence: true
  validates :event_name, presence: true
  validates :location, presence: true

  enum location: %i[makerspace makerlab119 makerlab121 sandbox mill1 lathe1 lathe2 welding1 welding2]

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
      trailer: "CEED Trailer"
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
      trailer: "CEED Trailer"
    }
    all_locations_list[location.to_sym]
  end

end
