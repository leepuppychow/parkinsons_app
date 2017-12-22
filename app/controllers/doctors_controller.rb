class DoctorsController < ApplicationController

  def new
    @patient = Patient.find(params[:patient_id])
    @doctor = Doctor.new
  end

  def create
    @patient = Patient.find(params[:patient_id])
    if @patient.doctor
      @patient.doctor.update(doctor_params)
    else
      doctor = Doctor.create!(doctor_params)
#there was an issue with patient not saving due to not having password
#using update_attribute allowed you to update and save the doctor, without needing all attributes
      @patient.update_attribute(:doctor, doctor)
    end
    redirect_to patient_therapists_path(@patient)
  end

  def edit
    @patient = Patient.find(params[:patient_id])
    @doctor = Doctor.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:patient_id])
    @doctor = Doctor.find(params[:id])
    if @doctor.update(doctor_params)
      redirect_to patient_therapists_path(@patient)
    else
      render :edit
    end
  end

  def destroy
    patient = Patient.find(params[:patient_id])
    # doctor = Doctor.find(params[:id])
    patient.doctor.destroy
    # patient.doctor_id = nil
    redirect_to patient_therapists_path(patient)
  end

  private

    def doctor_params
      params.require(:doctor).permit(:first_name,
                                    :last_name,
                                    :specialty,
                                    :location,
                                    :years_experience)
    end
end
