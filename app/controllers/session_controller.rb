class SessionController < ApplicationController

  def new
  end

  def create_from_google
    @user = User.from_omniauth(auth_hash)
    session[:user_id] = @user.id
    if current_user.class == Patient
      redirect_to patient_path(current_user)
    elsif current_user.class == Doctor
      redirect_to doctor_path(current_user)
    elsif current_user.class == User
      render :new
    end
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      take_user_to_landing_page(user)
    else
      flash[:notice] = "Either username or password is incorrect."
      redirect_to root_path
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

    def take_user_to_landing_page(user)
      if user.username == "admin"
        redirect_to admin_welcome_index_path
      elsif user.patient
        redirect_to patient_path(current_user)
      elsif user.doctor
        redirect_to doctor_path(current_user)
      end
    end

end
