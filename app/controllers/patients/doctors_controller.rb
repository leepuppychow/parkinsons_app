class Patients::DoctorsController < ApplicationController

  def create
    doctor = Doctor.find(params[:doctor_id])
    doctor.note = blank_note(doctor)
    current_user.doctors << doctor unless current_user.doctors.find_by(name: doctor.name)
    redirect_to patient_doctors_path(current_user)
  end

end
