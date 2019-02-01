class AddApprovedByFieldToBooking < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :approved_by, :integer
  end
end
