class Doctor < ApplicationRecord
  has_many :appointments
  has_many :clinic_doctors
  has_many :clinics, through: :clinic_doctors

  def full_name
    "#{first_name} #{last_name}"
  end
end
