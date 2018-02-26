class UsersController < ApplicationController
  before_action :specialties

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) || current_user
    if @user.save && patient_params
      create_user_as_patient(@user)
      session[:user_id] = @user.id
      redirect_to patient_path(@user.patient)
    elsif @user.save && doctor_params
      create_user_as_doctor(@user)
      session[:user_id] = @user.id
      redirect_to doctor_path(@user.doctor)
    else
      flash[:notice] = "Please enter all information."
      render :new
    end
  end

  def update
    if patient_params
      create_user_as_patient(current_user)
      redirect_to patient_path(current_user)
    elsif doctor_params
      create_user_as_doctor(current_user)
      redirect_to doctor_path(current_user)
    end
  end

  private

    def create_user_as_patient(user)
      @patient = Patient.new(patient_params)
      @user.patient = @patient
      if @patient.save
        true
      else
        render :new
      end
    end

    def create_user_as_doctor(user)
      @doctor = Doctor.new(doctor_params)
      @user.doctor = @doctor
      if @doctor.save
        true
      else
        render :new
      end
    end

    def user_params
      if params[:user]
        params.require(:user).permit(:username, :password)
      end
    end

    def patient_params
      if params[:patient]
        params.require(:patient).permit(:first_name, :last_name)
      else
        false
      end
    end

    def doctor_params
      if params[:doctor]
        params.require(:doctor).permit(:name, :specialty, :location, :phone)
      else
        false
      end
    end

end
