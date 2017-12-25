class MedicationsController < ApplicationController
  before_action :current_user

  def index
    @medications = @patient.patient_medications
  end

  def new
    @medication = Medication.new
  end

  def create
    @patient = Patient.find(params[:patient_id])
    #this if block checks if the medication name is already in the Medication DB
    #if so, use that existing medication, otherwise add a new one to Medication DB
    #and to the patient's patient_medications list

#FIND OR CREATE BY METHOD!!
    if Medication.find_by(name: medication_params[:name])
      @medication = Medication.find_by(name: medication_params[:name])
    else
      @medication = Medication.create(medication_params)
    end

    new_med = @patient.patient_medications.new(dosage_frequency_params)
    new_med.medication_id = @medication.id
    if new_med.save
      flash[:success] = "Added new medication successfully!"
      redirect_to patient_medications_path(@patient)
    else
      flash[:notice] = "Please enter all information"
      render :new
    end
  end

  def edit
    @medication = @patient.patient_medications.find(params[:id]).medication
  end

  def update
    @medication = @patient.medications.find(params[:id])
    if @medication.update!(medication_params)
      @medication.patient_medications.update(patient_medications_params)
      redirect_to patient_medications_path(@patient)
    else
      render :edit
    end
  end

  def destroy
    @patient.patient_medications.find(params[:id]).destroy
    redirect_to patient_medications_path(@patient)
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
