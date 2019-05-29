class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :worksite
  validates :start_date, presence: true
  validates :end_date, presence: true

  def plage_date
    "du #{start_date.strftime("%d/%m/%Y")} au #{end_date.strftime("%d/%m/%Y")}"
  end
end
