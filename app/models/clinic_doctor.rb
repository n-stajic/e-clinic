class ClinicDoctor < ApplicationRecord
  belongs_to :clinic
  belongs_to :doctor
end
