class AppointmentsController < ApplicationController

  def index
    @appointments = current_user.appointments
    @appointment = Appointment.new
  end

  def destroy
    appointment = current_user.appointments.find(params[:id])
    appointment.destroy
    redirect_to patient_appointments_path(current_user)
  end

end
