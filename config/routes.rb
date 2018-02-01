Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"
  get 'login', to: redirect('/auth/google_oauth2'), as: 'login'
  get 'logout', to: "session#destroy", as: 'logout'
  get "/auth/google_oauth2/callback", to: "session#create"


  # get "/login", to: "session#new"
  # post "/login", to: "session#create"
  # get "/logout", to: "session#destroy"
  get '/patients/activity_filter', to: "activities#index"

  resources :patients, only: [:new, :create, :show] do
    resources :appointments, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :medications do
      resources :note, only: [:update]
    end
    resources :therapists do
      resources :note, only: [:update]
    end
    resources :doctors do
      resources :note, only: [:update]
    end
    resources :activities
    resources :exercises, only: [:index]
    resources :articles, only: [:index, :create, :show]
      #Note: the articles show page is the patient's twitter search page
    resources :find_doctor, only: [:index, :create]
  end

  namespace :admin do
    resources :welcome, only: [:index]
    resources :patients, only: [:index]
    resources :doctors, only: [:index]
    resources :medications, only: [:index]
    resources :exercises
    resources :therapists, only: [:index]
    resources :note, only: [:index]
  end

  namespace :visitor do
    resources :welcome, only: [:index]
    resources :exercises, only: [:index]
    resources :articles, only: [:index, :create]
    resources :twitter, only: [:index]
    resources :find_doctor, only: [:index, :create]
  end

end
