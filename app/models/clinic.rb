class Clinic < ApplicationRecord
  belongs_to :address
  has_many :halls
  has_many :appointments
  has_many :clinic_doctors
  has_many :doctors, through: :clinic_doctors
  has_many :price_lists
  has_many :schedules

  scope :not_on_vacation, -> (date) { left_outer_joins(doctors: :vacations).where("vacations.from > ? OR vacations.to < ? OR vacations.id IS NULL", date, date) }
  scope :qualified, -> (examination_type) { left_outer_joins(doctors: :examination_types).where("examination_types.kind = ?", examination_type) }

  def full_address
    "#{address.street}, #{address.city}, #{address.country}"
  end

  def price(examination_type)
    et = ExaminationType.find_by(kind: examination_type)
    price_lists.active.price_item_price(et)
  end
end
