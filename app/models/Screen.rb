class Screen < ApplicationRecord
  belongs_to :theater
  belongs_to :movie
  has_many :showtimes
  validates :number, presence: true
end
