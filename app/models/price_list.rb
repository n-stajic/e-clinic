class PriceList < ApplicationRecord
  belongs_to :clinic
  has_many :price_items
end
