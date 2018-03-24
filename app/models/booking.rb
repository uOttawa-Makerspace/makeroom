class Booking < ApplicationRecord
  enum location: %i[makerspace makerlab makerlounge brunsfield]

  def date_humanize
    start = I18n.l start_date, format: :short if start_date.present?
    end_time = I18n.l end_date, format: :short if start_date.present?
    start + " - " + end_time
  end

  def self.location_list
    {
      makerspace: "Makerspace",
      makerlab: "Makerlab",
      makerlounge: "Makerlounge",
      brunsfield: "Brunsfield Center",
    }
  end

  def location_humanize
    all_locations_list = {
      makerspace: "Makerspace",
      makerlab: "Makerlab",
      makerlounge: "Makerlounge",
      brunsfield: "Brunsfield Center",
    }
    all_locations_list[location.to_sym]
  end
end
