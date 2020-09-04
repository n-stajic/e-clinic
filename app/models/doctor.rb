class Doctor < ApplicationRecord
  has_many :appointments
  has_many :clinic_doctors
  has_many :clinics, through: :clinic_doctors
  has_many :schedules
  has_many :vacations
  has_many :doctor_examination_types
  has_many :examination_types, through: :doctor_examination_types

  scope :not_on_vacation, -> (date) { left_outer_joins(:vacations).where("vacations.from > ? OR vacations.to < ? OR vacations.id IS NULL", date, date) }
  scope :qualified, -> (examination_type) { left_outer_joins(:examination_types).where(examination_types: {kind: examination_type}) }
  scope :by_clinic, -> (clinic_id) { joins(:clinic_doctors).where(clinic_doctors: {clinic_id: clinic_id}) }
  scope :working_on, -> (date, clinic_id) { joins(:schedules).where("schedules.schedule->>? IS NOT NULL AND schedules.clinic_id = ?", date.strftime("%A").downcase, clinic_id) }

  def full_name
    "#{first_name} #{last_name}"
  end
end
