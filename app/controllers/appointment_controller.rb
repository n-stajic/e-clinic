class AppointmentController < ApplicationController
  before_action :authenticate_patient!

  def index
    @appointments = Appointment.joins(:clinic).joins(:hall).joins(:doctor)
                    .joins(:price_item).where(patient: current_patient)
                    .order(params[:order_by])
  end
end
