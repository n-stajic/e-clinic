class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :clinic
  belongs_to :hall
  belongs_to :price_item
  belongs_to :patient, optional: true

  scope :active, -> { where("date > ?", Time.zone.now+1.day)}

  def price
    price_item.price
  end

  def discounted_price
    (price - (price / 100) * discount).round(2)
  end
end
