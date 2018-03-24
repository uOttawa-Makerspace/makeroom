class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.string :name
      t.string :email
      t.string :event_name
      t.string :staff_id
      t.string :staff_name
      t.integer :location
      t.boolean :approved
      t.datetime :date

      t.timestamps
    end
  end
end
