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
    @date = Date.parse(params[:date].keys[0])
    @examination_type = params[:examination_type]
    @clinics = Clinic.not_on_vacation(@date).qualified(@examination_type).working_on(@date).uniq
  end
end
