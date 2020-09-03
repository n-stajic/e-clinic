class PriceItem < ApplicationRecord
  enum kind: { operation: "operation", examination: "examination" }

  belongs_to :price_list
  has_many :appointments
end
