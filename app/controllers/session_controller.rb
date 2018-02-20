class SessionController < ApplicationController

  def new
  end

  def create_google
    # @patient = Patient.from_omniauth(auth_hash)
    # session[:user_id] = @patient.id
    # redirect_to patient_path(@patient)
  end

  def create
    @patient = Patient.find_by(username: params[:username])
    if @patient && @patient.authenticate(params[:password])
      session[:user_id] = @patient.id
      if @patient.username == "admin"
        redirect_to admin_welcome_index_path
      else
        redirect_to patient_path(@patient)
      end
    else
      flash[:notice] = "Either username or password is incorrect."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been logged out successfully."
    redirect_to "/"
  end

  private

    def auth_hash
  		request.env['omniauth.auth']
    end


end
