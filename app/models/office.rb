class Office < ApplicationRecord
  validates :name, presence: true, allow_blank: false
  validates :description, presence: true, allow_blank: false
  validates :address, presence: true, allow_blank: false
  validates :price, presence: true, allow_blank: false
  validates :availability_description, presence: true, allow_blank: false
  validates :table_num, presence: true, allow_blank: false
  validates :wifi, presence: true
  validates :amenities, presence: true, allow_blank: false

  belongs_to :user

  has_many :bookings

  has_one_attached :photo
end
