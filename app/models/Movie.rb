class Movie < ApplicationRecord
  has_many :showtimes
  has_many :screens
  validates :name, presence: true
end
