class AddColumnsForRecurringBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :repeat, :boolean, default: false
    add_column :bookings, :frequency, :integer, limit: 1, default: 0
    add_column :bookings, :anchor, :date
    add_column :bookings, :until_date, :date
  end
end
