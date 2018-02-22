class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
    return @user.patient if @user.patient
    return @user.doctor if @user.doctor
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def specialties
    @specialties = ["Cardiologist", "Family-Practitioner", "Neurologist",
      "Neurosurgeon", "Orthopedic-Surgeon", "Physiatrist" ,"Psychiatrist",
      "Psychologist", "Occupational-Therapist", "Physical-Therapist",
      "Speech-Therapist", "Mental-Health-Counselor"]
  end

  def states
    @states = ["AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI",
              "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI",
              "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC",
              "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT",
              "VT", "VA", "WA", "WV", "WI", "WY"]
  end

  def blank_note(provider)
    Note.create(contents: "", noteable_id: provider.id, noteable_type: provider.class.name)
  end

end
