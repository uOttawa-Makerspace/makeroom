class AddStartAndEndDate < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :end_date, :datetime
    rename_column :bookings, :date, :start_date
  end
end
