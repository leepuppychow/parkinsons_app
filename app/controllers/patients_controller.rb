class PatientsController < ApplicationController

  def show
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      flash[:notice] = "New user created successfully :)"
      session[:user_id] = @patient.id
      redirect_to patient_path(@patient)
    else
      flash[:notice] = "Please enter all information."
      render :new
    end
  end

  private

    def patient_params
      params.require(:patient).permit(:first_name, :last_name, :username, :age, :password)
    end

end
