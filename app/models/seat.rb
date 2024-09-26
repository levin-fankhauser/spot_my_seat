class Seat < ApplicationRecord
  belongs_to :user

  validates :train, presence: true, inclusion: { in: [ "IR27", "S3" ] }
  validates :wagons, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :current_wagon, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :seat_number, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :floor, presence: true, inclusion: { in: [ 0, 1 ] }

  has_paper_trail
end
