Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"
  get "/login", to: "session#new"
  post "/login", to: "session#create"
  get "/logout", to: "session#destroy"

  resources :patients, only: [:new, :create, :show] do
    resources :medications
    resources :therapists
    resources :doctors
    resources :activities
    resources :exercises, only: [:index]
    resources :articles, only: [:index, :create, :show]
  end

  namespace :admin do
    resources :welcome, only: [:index]
    resources :patients, only: [:index]
    resources :doctors, only: [:index]
    resources :medications, only: [:index]
    resources :exercises, only: [:index]
    resources :therapists, only: [:index]
  end

end
