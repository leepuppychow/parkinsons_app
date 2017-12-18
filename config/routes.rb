Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"

  # resources :doctor do
  #   resources :patients
  # end

  resources :patients, only: [:new, :create, :show] do
    resources :medications
    resources :therapists
    resources :doctors
  end






end
