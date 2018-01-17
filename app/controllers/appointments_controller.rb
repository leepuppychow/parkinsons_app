class AppointmentsController < ApplicationController

  def index
    @appointments = current_user.appointments
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @doctor = Doctor.find_by(name: appointment_params[:appointable])
    @therapist = Therapist.find_by(name: appointment_params[:appointable])

    if @doctor != nil
      @appointment = Appointment.new(patient: current_user,
                                    appointable_id: @doctor.id,
                                    appointable_type: @doctor.class.name,
                                    date_time: appointment_params[:date_time])
    elsif @therapist != nil
      @appointment = Appointment.new(patient: current_user,
                                    appointable_id: @therapist.id,
                                    appointable_type: @therapist.class.name,
                                    date_time: appointment_params[:date_time])
    end

    if @appointment.save
      flash[:notice] = "Appointment added successfully"
      redirect_to patient_appointments_path(current_user)
    else
      flash[:notice] = "Error occurred, please try again."
      render :new
    end
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
    @appointment = Appointment.find(params[:id])
    @doctor = Doctor.find_by(name: appointment_params[:appointable])
    @therapist = Therapist.find_by(name: appointment_params[:appointable])

    if @doctor != nil
      if @appointment.update(patient: current_user,
                            appointable_id: @doctor.id,
                            appointable_type: @doctor.class.name,
                            date_time: appointment_params[:date_time])
        flash[:notice] = "Appointment was updated successfully"
        redirect_to patient_appointments_path(current_user)
      else
        flash[:notice] = "Some information missing or error occurred, appointment not updated"
        render :edit
      end
    elsif @therapist != nil
      if @appointment.update(patient: current_user,
                            appointable_id: @therapist.id,
                            appointable_type: @therapist.class.name,
                            date_time: appointment_params[:date_time])
        flash[:notice] = "Appointment was updated successfully"
        redirect_to patient_appointments_path(current_user)
      else
        flash[:notice] = "Some information missing or error occurred, appointment not updated"
        render :edit
      end
    end
  end

  private

    def appointment_params
      params.require(:appointment).permit(:date_time, :appointable)
    end

end
