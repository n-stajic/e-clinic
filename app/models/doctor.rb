class Doctor < ApplicationRecord
  has_many :appointments
  has_many :clinic_doctors
  has_many :clinics, through: :clinic_doctors
end
