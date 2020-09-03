Rails.application.routes.draw do
  authenticated :patient do
    root to: "home#index", as: :authenticated_patient_root
  end
  authenticated :clinical_center_admin do
    root to: "approval#index", as: :authenticated_clinical_center_admin_root
  end
  devise_scope :patient do
    root to: "devise/sessions#new"
  end

  devise_for :patients, controllers: {
    registrations: "patients/registrations"
  }

  get "clinics", to: "clinic#index"
  get "clinics/:id", to: "clinic#show", as: "show_clinic"
  get "appointments", to: "appointment#index"

  devise_for :clinical_center_admins, only: [:sessions]

  get "approvals", to: "approval#index"
  get "approve_patient/:patient_id", to: "approval#approve_patient", as: "approve_patient"
end
