class Booking < ApplicationRecord
  # Validations
  validates :car_id, presence: true

  # Associations
  belongs_to :car
  belongs_to :user

end
