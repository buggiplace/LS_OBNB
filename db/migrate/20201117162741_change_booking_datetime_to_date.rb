class ChangeBookingDatetimeToDate < ActiveRecord::Migration[6.0]
  def change
    change_column :bookings, :booking_start, :date
    change_column :bookings, :booking_end, :date
  end
end
