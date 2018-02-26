class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :specialties, :set_beginning_of_week
  helper_method :current_user

  def set_beginning_of_week
    Date.beginning_of_week = :sunday
  end

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
    if @user.patient
      return @user.patient
    elsif @user.doctor
      return @user.doctor
    else
      @user
    end
  end

  def current_admin?
    current_user.username == "admin"
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
