class Room < ApplicationRecord
  belongs_to :user
  has_many :photos
  has_many :reservations

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :home_typing, :accommodate, :bed_room, :bath_room, :listing_name, :summary, :address, presence: true
  validates :address, length: {maximum: 50}
  validates :summary, length: {maximum: 1000}

end
