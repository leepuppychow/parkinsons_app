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
      @patient.doctor.new(doctor_params)
    end
    redirect_to patient_therapists_path(@patient)
  end

  def edit
    @patient = Patient.find(params[:patient_id])
  end

  def update
    @patient = Patient.find(params[:patient_id])
    @doctor = @patient.doctor
    if @doctor.update(doctor_params)
      redirect_to patient_therapists_path(@patient)
    else
      render :edit
    end
  end

  def destroy
    patient = Patient.find(params[:patient_id])
    # doctor = Doctor.find(params[:id])
    patient.doctor.delete
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
