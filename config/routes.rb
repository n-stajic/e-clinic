Rails.application.routes.draw do
  root to: "home#index"

  devise_for :patients, controllers: {
    registrations: 'patients/registrations'
  }
  devise_for :clinical_center_admins

  get "approvals", to: "approval#index"
  get "approve_patient/:patient_id", to: "approval#approve_patient", as: "approve_patient"
end
