class Theater < ApplicationRecord
  has_many :screens
  validates :name, presence: true
  validates :address, presence: true
end
