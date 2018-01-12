class DoctorsController < ApplicationController
  before_action :specialties

  def new
    @doctor = Doctor.new
  end

  def create
    if params[:find_doctor]
      @doctor = current_user.doctors.create!(first_name: params[:find_doctor][0],
        last_name: params[:find_doctor][0], location: params[:find_doctor][2],
        specialty: params[:find_doctor][1])
      redirect_to patient_therapists_path(current_user)
    else
      @doctor = current_user.doctors.find_or_create_by(doctor_params)
      if @doctor.save
        redirect_to patient_therapists_path(current_user)
      else
        flash[:notice] = "Please enter all information."
        render :new
      end
    end
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = current_user.doctors.find(params[:id])
    if @doctor.update(doctor_params)
      redirect_to patient_therapists_path(current_user)
    else
      flash[:notice] = "Please enter all information."
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
