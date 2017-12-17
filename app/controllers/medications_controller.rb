class MedicationsController < ApplicationController
  def index
    @patient = Patient.find(params[:patient_id])
    @medications = @patient.patient_medications
  end

end
