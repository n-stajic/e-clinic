class DoctorExaminationType < ApplicationRecord
  belongs_to :doctor
  belongs_to :examination_type
end
