class TherapistsController < ApplicationController

  def index
  end

  def new
    @therapist = Therapist.new
  end

  def create
    @therapist = current_user.therapists.find_or_create_by(therapist_params)
    if @therapist.save
      redirect_to patient_therapists_path(current_user)
    else
      flash[:notice] = "Please enter all information."
      render :new
    end
  end

  def edit
    @therapist = Therapist.find(params[:id])
  end

  def update
    @therapist = current_user.therapists.find(params[:id])
    if @therapist.update(therapist_params)
      redirect_to patient_therapists_path(current_user)
    else
      flash[:notice] = "Please enter all information."
      render :edit
    end
  end

  def destroy
    current_user.therapist_patients.find_by(therapist_id: params[:id]).destroy
    redirect_to patient_therapists_path(current_user)
  end

  private

    def therapist_params
      params.require(:therapist).permit(:first_name,
                                        :last_name,
                                        :therapy_type)
    end

end
