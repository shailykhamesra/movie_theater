class Booking < ApplicationRecord
  belongs_to :showtime
  has_many :tickets
  validates :name, presence: true
  validates :phone, presence: true
  validates :creditcard, presence: true
end
