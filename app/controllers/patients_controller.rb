class PatientsController < ApplicationController

  def show
    @patient = current_user
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      session[:user_id] = @patient.id
      redirect_to patient_path(@patient)
    else
      render :new
    end
  end

  private

    def patient_params
      params.require(:patient).permit(:first_name, :last_name, :username, :age, :password)
    end

end
