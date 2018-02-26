class DoctorsController < ApplicationController
  before_action :specialties

  def index
  end

  def new
    @doctor = Doctor.new
    @all_doctors = Doctor.all
  end

  def show
    @appointments = current_user.appointments.today.sorted_by_time
  end

  def create
    if params[:find_doctor]
      @doctor = current_user.doctors.find_or_create_by(name: params[:find_doctor][0],
                                              location: params[:find_doctor][2],
                                              specialty: params[:find_doctor][1],
                                              phone: params[:find_doctor][3])
      @doctor.note = blank_note(@doctor)
      redirect_to patient_doctors_path(current_user)
    else
      @doctor = current_user.doctors.find_or_create_by(doctor_params)
      if @doctor.save
        @doctor.note = blank_note(@doctor)
        redirect_to patient_doctors_path(current_user)
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
      redirect_to patient_doctors_path(current_user)
    else
      flash[:notice] = "Please enter all information."
      render :edit
    end
  end

  def destroy
    if current_user.appointments.find_by(doctor_id: params[:id])
      current_user.appointments.find_by(doctor_id: params[:id]).destroy
    end
    current_user.patient_doctors.find_by(doctor_id: params[:id]).destroy
    redirect_to patient_doctors_path(current_user)
  end

  private

    def doctor_params
      params.require(:doctor).permit(:name, :phone, :specialty, :location)
    end
end
