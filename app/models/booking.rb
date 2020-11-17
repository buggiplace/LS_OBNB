class Booking < ApplicationRecord
  belongs_to :office
  belongs_to :user

  validates :booking_start, presence: true
  validates :booking_end, presence: true
end
