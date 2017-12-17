class TherapistsController < ApplicationController

  def index
    @patient = Patient.find(params[:patient_id])
    @therapists = @patient.therapists
    @doctor = @patient.doctor
  end

end
