class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :worksite
  validates :start_date, presence: true
  validates :end_date, presence: true
end
