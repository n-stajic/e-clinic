class PriceList < ApplicationRecord
  belongs_to :clinic
  has_many :price_items

  scope :active, ->  { find_by(active: true)}
  scope :price_item_type, -> (examination_type) { joins(price_items: :examination_type).where(examination_type: examination_type) }

  def price_item_price(examination_type)
    price_items.find_by(examination_type: examination_type)&.price
  end
end
