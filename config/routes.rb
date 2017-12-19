Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"

  get "/login", to: "session#new"
  post "/login", to: "session#create"
  get "/logout", to: "session#destroy"

  # resources :doctor do
  #   resources :patients
  # end

  resources :patients, only: [:new, :create, :show] do
    resources :medications
    resources :therapists
    resources :doctors
  end






end
