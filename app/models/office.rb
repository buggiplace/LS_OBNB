class Office < ApplicationRecord
  validates :office_name, presence: true
  validates :description, presence: true
  validates :address_street, presence: true
  validates :address_zip, presence: true
  validates :address_city, presence: true
  validates :rate_per_day, presence: true
  validates :table_num, presence: true

  belongs_to :user

  has_many :bookings

  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :save_to_geocode?

  def address
    [address_street, address_zip, address_city].compact.join(', ')
  end

  def save_to_geocode?
    will_save_change_to_address_street? && will_save_change_to_address_zip? && will_save_change_to_address_city?
  end
end
