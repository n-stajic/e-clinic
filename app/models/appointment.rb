class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :clinic
  belongs_to :hall
  belongs_to :price_item
  belongs_to :patient
end
