class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @patient ||= Patient.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def specialties
    @specialties = ["Family-Practitioner", "Neurologist", "Cardiologist","Psychiatrist",
      "Neurosurgeon", "Physiatrist", "Orthopedic-Surgeon",
      "Physical-Therapist", "Occupational-Therapist", "Speech-Therapist",
      "Psychologist", "Mental-Health-Counselor"
    ]
  end

  def states
    @states = ["AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI",
              "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI",
              "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC",
              "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT",
              "VT", "VA", "WA", "WV", "WI", "WY"]
  end

end
