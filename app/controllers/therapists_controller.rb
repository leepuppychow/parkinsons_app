class TherapistsController < ApplicationController
  before_action :current_user

  def index
    @therapists = @patient.therapists
  end

  def new
    @therapist = @patient.therapists.new
  end

  def create
    @therapist = @patient.therapists.find_or_create_by(therapist_params)
    if @therapist.id == nil
      render :new
    else
      redirect_to patient_therapists_path(@patient)
    end
  end

  def edit
    @therapist = Therapist.find(params[:id])
  end

  def update
    @therapist = Therapist.find(params[:id])
    if @therapist.update(therapist_params)
      redirect_to patient_therapists_path(@patient)
    else
      render :edit
    end
  end

  def destroy
    @patient.therapist_patients.find_by(therapist_id: params[:id]).destroy
    redirect_to patient_therapists_path(@patient)
  end

  private

    def therapist_params
      params.require(:therapist).permit(:first_name,
                                        :last_name,
                                        :years_experience,
                                        :therapy_type)
    end

end
