class PriceItem < ApplicationRecord
  belongs_to :price_list
  belongs_to :examination_type
  has_many :appointments
end
