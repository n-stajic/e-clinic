class ApprovalController < ApplicationController
  before_action :authenticate_clinical_center_admin!

  def index
    @patients = Patient.where(approved: false)
  end

  def approve_patient
    patient = Patient.find_by(id: params[:patient_id])
    if patient.present?
      patient.update(approved: true)

      redirect_to approvals_path, notice: "Patient #{patient.email} successfully approved"
    else
      redirect_to approvals_path, alert: "Patient with id #{params[:patient_id]} was not found"
    end
  end
end
