class Showtime < ApplicationRecord
  belongs_to :movie
  belongs_to :screen
  has_many :bookings
  has_many :tickets
  validates :timings, presence: true
end
