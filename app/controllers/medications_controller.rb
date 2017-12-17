class MedicationsController < ApplicationController
  def index
    @patient = Patient.find(params[:patient_id])
    @medications = @patient.patient_medications
  end

  def new
    @patient = Patient.find(params[:patient_id])
    @medication = Medication.new

  end

  def create
    medication = Medication.new(medication_params)
  end

  private

    def medication_params
      params.require(:medication).permit(:name)
    end

end
