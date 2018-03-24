class Booking < ApplicationRecord
  enum location: %i[makerspace makerlab makerlounge brunsfield]

  def date_humanize
    I18n.l start_date, format: :short if start_date.present?
  end

  def self.location_list
    {
      makerspace: "Makerspace",
      makerlab: "Makerlab",
      makerlounge: "Makerlounge",
      brunsfield: "Brunsfield Center",
    }
  end
end
