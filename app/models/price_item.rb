class PriceItem < ApplicationRecord
  belongs_to :price_list
  has_many :appointments
end
