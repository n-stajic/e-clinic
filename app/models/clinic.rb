class Clinic < ApplicationRecord
  belongs_to :address
  has_many :halls
  has_many :appointments
  has_many :clinic_doctors
  has_many :doctors, through: :clinic_doctors
  has_many :price_lists
end
