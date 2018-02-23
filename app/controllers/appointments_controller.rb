class AppointmentsController < ApplicationController

  def index
    @appointments = current_user.appointments
    @appointment = Appointment.new
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = current_user.appointments.new(appointment_params)
    if @appointment.save
      redirect_to patient_appointments_path(current_user)
    else
      render :new
    end
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
    @appointment = current_user.appointments.find(params[:id])
    if @appointment.update(appointment_params)
      redirect_to patient_appointments_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    appointment = current_user.appointments.find(params[:id])
    appointment.destroy
    redirect_to patient_appointments_path(current_user)
  end

  private

    def appointment_params
      params.require(:appointment).permit(:date_time, :doctor_id)
    end
end
