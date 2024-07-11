class Booking < ApplicationRecord
  # Validations
  validates :car_id, :starts_at, :ends_at, presence: true

  # Associations
  belongs_to :car
  belongs_to :user

end
