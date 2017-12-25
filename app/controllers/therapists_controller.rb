class TherapistsController < ApplicationController
  def index
    @therapists = current_user.therapists
  end

  def new
    @therapist = current_user.therapists.new
  end

  def create
    @therapist = current_user.therapists.find_or_create_by(therapist_params)
    if @therapist.id == nil
      render :new
    else
      redirect_to patient_therapists_path(current_user)
    end
  end

  def edit
    @therapist = Therapist.find(params[:id])
  end

  def update
    @therapist = Therapist.find(params[:id])
    if @therapist.update(therapist_params)
      redirect_to patient_therapists_path(current_user)
    else
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
                                        :years_experience,
                                        :therapy_type)
    end

end
