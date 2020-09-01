Rails.application.routes.draw do
  devise_for :clinical_center_admins
  root to: 'home#index'
  devise_for :patients
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
