class ClinicController < ApplicationController
  before_action :authenticate_patient!

  def index
    @clinics = Clinic.all.joins(:address).order(params[:order_by])
  end
end
