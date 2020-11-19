class Booking < ApplicationRecord
  belongs_to :office
  belongs_to :user

  validates :booking_start, presence: true
  validates :booking_end, presence: true
  validate :booking_start_can_not_be_in_the_past
  validate :booking_end_can_not_be_before_booking_start
  validates :status, inclusion: { in: ["Pending", "Accepted", "Rejected"]}

  private

  def booking_start_can_not_be_in_the_past
    if booking_start.past?
      errors.add(:booking_start, "can't be in the past")
    end
  end

  def booking_end_can_not_be_before_booking_start
    if booking_end < booking_start
      errors.add(:booking_end, "can't be before the booking start")
    end
  end  
end
