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
  after_validation :geocode, if: :will_save_change_to_address?
end
