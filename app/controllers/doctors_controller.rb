class DoctorsController < ApplicationController

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = current_user.doctors.find_or_create_by(doctor_params)
    if @doctor.id == nil
      render :new
    else
      redirect_to patient_therapists_path(current_user)
    end
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:id])
    if @doctor.update(doctor_params)
      redirect_to patient_therapists_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    current_user.patient_doctors.find_by(doctor_id: params[:id]).destroy
    redirect_to patient_therapists_path(current_user)
  end

  private

    def doctor_params
      params.require(:doctor).permit(:first_name,
                                    :last_name,
                                    :specialty,
                                    :location)
    end
end
