class ClinicController < ApplicationController
  before_action :authenticate_patient!

  def index
    @clinics = Clinic.all.joins(:address).order(params[:order_by])
  end

  def show
    @clinic = Clinic.find(params[:id])
    @appointments = @clinic.appointments.where(patient: nil, fast: false)
    @price_list = @clinic.price_lists.find_by(active: true)
  end
end
