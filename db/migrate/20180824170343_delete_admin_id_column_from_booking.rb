class DeleteAdminIdColumnFromBooking < ActiveRecord::Migration[5.1]
  def change
    remove_column :bookings, :staff_id, :string
    remove_column :bookings, :staff_name, :string
  end
end
