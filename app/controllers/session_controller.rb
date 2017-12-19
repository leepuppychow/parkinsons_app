class SessionController < ApplicationController

  def new
  end

  def create
    @patient = Patient.find_by(username: params[:username])
    if @patient && @patient.authenticate(params[:password])
      session[:user_id] = @patient.id
      redirect_to patient_path(@patient)
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/"
  end

end
