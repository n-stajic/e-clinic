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

  def search
    @clinics = Clinic.not_on_vacation(params[:date]).qualified(params[:examination_type]).uniq
    @examination_type = params[:examination_type]
  end
end
