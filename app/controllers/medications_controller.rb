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
    patient = Patient.find(params[:patient_id])
    medication = Medication.create(medication_params)
    new_med = patient.patient_medications.new(dosage_frequency_params)
    new_med.medication_id = medication.id
    if new_med.save
      flash[:success] = "Added new medication successfully!"
      redirect_to patient_medications_path(patient)
    else
      flash[:error] = "Please enter all information"
      redirect_to new_patient_medication_path(patient)
    end
  end

  def edit
    @patient = Patient.find(params[:patient_id])
    @medication = @patient.patient_medications.find(params[:id]).medication
  end

  def update
    patient = Patient.find(params[:patient_id])
    patient_medication = patient.patient_medications.find(params[:id])
    medication = patient_medication.medication

    medication.update(medication_params)
    patient_medication.update(patient_medications_params)
    redirect_to patient_medications_path(patient)
  end

  private

    def medication_params
      params.require(:medication).permit(:name)
    end

    def dosage_frequency_params
      params[:medication].require(:medications).permit(:dosage, :freq_per_day)
    end

    def patient_medications_params
      params[:medication][:patient_medications_attributes]["0"].permit!
    end

end
