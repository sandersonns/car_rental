class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :brand, :model, :year_of_production, :address, :price_per_day, presence: true
end
