class MedicationsController < ApplicationController

  def index
    @medications = current_user.patient_medications
  end

  def new
    @medication = Medication.new
  end

  def create
    @medication = Medication.find_or_create_by(medication_params)
    new_med = current_user.patient_medications.new(dosage_frequency_params)
    new_med.medication_id = @medication.id
    if new_med.save
      redirect_to patient_medications_path(current_user)
    else
      flash[:notice] = "Please enter all information"
      render :new
    end
  end

  def edit
    @medication = current_user.patient_medications.find(params[:id]).medication
  end

  def update
    @medication = current_user.medications.find(params[:id])
    if @medication.update(medication_params)
      @medication.patient_medications.update(patient_medications_params)
      redirect_to patient_medications_path(current_user)
    else
      flash[:notice] = "Please enter all information."
      render :edit
    end
  end

  def destroy
    current_user.patient_medications.find(params[:id]).destroy
    redirect_to patient_medications_path(current_user)
  end

  private

    def medication_params
      params.require(:medication).permit(:name)
    end

    def dosage_frequency_params
      params[:medication].require(:new_medication).permit(:dosage, :freq_per_day)
    end

    def patient_medications_params
      params[:medication][:patient_medications_attributes]["0"].permit!
    end

end
