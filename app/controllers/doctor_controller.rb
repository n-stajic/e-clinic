class DoctorController < ApplicationController
  before_action :authenticate_patient!

  def index
    date = Date.parse(params[:date])
    @doctors = Doctor.by_clinic(params[:clinic_id])
                .not_on_vacation(date)
                .qualified(params[:examination_type])
                .working_on(date, params[:clinic_id])
  end
end
