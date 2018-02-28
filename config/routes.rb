Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"
  get 'logout', to: "session#destroy", as: 'logout'
  post "/", to: "session#create", as: 'login'

  get "/auth/google_oauth2/callback", to: "session#create_from_google"
  get '/patients/activity_filter', to: "activities#index"

  namespace "api" do
    namespace "v1" do
      resources :doctors, only: [:index]
    end
  end

  resources :users, only: [:new, :create, :update]

  resources :doctors, only: [:show] do
    scope module: 'provider' do
      resources :messages, only: [:new, :create]
      resources :appointments, only: [:index, :new, :create, :edit, :update, :destroy]
      resources :patients, only: [:index]
      resources :articles, only: [:index, :create]
    end
    get "/tools", to: "provider/tools#index"
  end

  resources :patients, only: [:new, :create, :show] do
    # resources :appointments, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :appointments, only: [:index, :destroy]
    resources :medications do
      resources :note, only: [:update]
    end
    resources :doctors do
      resources :note, only: [:update]
    end
    resources :messages, only: [:new, :create]
    post "/new_doctor", to: "patients/doctors#create"
    post "/doctors/new_doctor", to: "patients/doctors#create"
    resources :activities
    resources :exercises, only: [:index]
    resources :articles, only: [:index, :create]
    resources :find_doctor, only: [:index, :create]
  end

  namespace :admin do
    resources :welcome, only: [:index]
    resources :patients, only: [:index]
    resources :doctors, only: [:index]
    resources :medications, only: [:index]
    resources :exercises
    resources :note, only: [:index]
  end

end
