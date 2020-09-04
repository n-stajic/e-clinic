class Doctor < ApplicationRecord
  has_many :appointments
  has_many :clinic_doctors
  has_many :clinics, through: :clinic_doctors
  has_many :schedules
  has_many :vacations
  has_many :doctor_examination_types
  has_many :examination_types, through: :doctor_examination_types

  def full_name
    "#{first_name} #{last_name}"
  end
end
