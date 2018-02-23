class AppointmentsController < ApplicationController

  def index
    @appointments = current_user.appointments
    @appointment = Appointment.new
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @doctor = Doctor.find_by(name: appointment_params[:appointable])
    create_provider(@doctor)
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
    @appointment = Appointment.find(params[:id])
    @doctor = Doctor.find_by(name: appointment_params[:appointable])
    update_provider(@doctor)
  end

  def destroy
    appointment = Appointment.find(params[:id])
    appointment.destroy
    redirect_to patient_appointments_path(current_user)
  end

  private

    def appointment_params
      params.require(:appointment).permit(:date_time, :appointable)
    end

    def create_provider(provider)
      @appointment = Appointment.new(patient: current_user,
                                    appointable_id: provider.id,
                                    appointable_type: provider.class.name,
                                    date_time: appointment_params[:date_time])
      if @appointment.save
        flash[:notice] = "Appointment added successfully"
        redirect_to patient_appointments_path(current_user)
      else
        flash[:notice] = "Error occurred, please try again."
        render :new
      end
    end

    def update_provider(provider)
      if @appointment.update(patient: current_user,
                            appointable_id: provider.id,
                            appointable_type: provider.class.name,
                            date_time: appointment_params[:date_time])
        flash[:notice] = "Appointment was updated successfully"
        redirect_to patient_appointments_path(current_user)
      else
        flash[:notice] = "Some information missing or error occurred, appointment not updated"
        render :edit
      end
    end
end
