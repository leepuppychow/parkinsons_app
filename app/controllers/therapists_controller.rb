class TherapistsController < ApplicationController

  def index
    @patient = Patient.find(params[:patient_id])
    @therapists = @patient.therapists
    @doctor = @patient.doctor
  end

  def new
    @patient = Patient.find(params[:patient_id])
    @therapist = @patient.therapists.new
  end

  def create
    # patient = Patient.find(params[:patient_id])
    # therapist = patient.therapists.create!(therapist_params)
    # redirect_to patient_therapists_path(patient)

    # therapist = patient.therapists.new(therapist_params)
    # if therapist.save
    #   redirect_to patient_therapists_path(patient)
    # else
    #   redirect_to new_patient_therapist_path(patient)
    # end

    patient = Patient.find(params[:patient_id])
    if therapist_params.values.include?("")
      redirect_to new_patient_therapist_path(patient)
    else
      patient.therapists.create!(therapist_params)
      redirect_to patient_therapists_path(patient)
    end
  end

  def edit
    @patient = Patient.find(params[:patient_id])
    @therapist = Therapist.find(params[:id])
  end

  def update
    patient = Patient.find(params[:patient_id])
    therapist = Therapist.find(params[:id])
    if therapist.update(therapist_params)
      therapist.update(therapist_params)
      redirect_to patient_therapists_path(patient)
    else
      redirect_to edit_patient_therapist_path(patient, therapist)
    end 
  end

  private

    def therapist_params
      params.require(:therapist).permit(:first_name,
                                        :last_name,
                                        :years_experience,
                                        :therapy_type,
                                        :patient)
    end

end
