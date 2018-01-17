class Ticket < ApplicationRecord
  belongs_to :showtime
  belongs_to :booking
  validates :price, presence: true
end
