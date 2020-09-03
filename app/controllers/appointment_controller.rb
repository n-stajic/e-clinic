class AppointmentController < ApplicationController
  before_action :authenticate_patient!

  def index
    @appointments = Appointment.joins(:clinic).joins(:hall).joins(:doctor)
                    .joins(:price_item).where(patient: current_patient)
                    .order(params[:order_by])
  end

  def fast_appointments
    @appointments = Appointment.where(clinic_id: params[:clinic_id], patient: nil, fast: true)
  end

  def fast_booking
    appointment = Appointment.find(params[:appointment_id])
    appointment.update(patient: current_patient)
    redirect_to fast_appointments_path(clinic_id: appointment.clinic_id), notice: "Appointment booked"
  end
end
