class TherapistsController < ApplicationController
  before_action :current_user

  def index
    @therapists = @patient.therapists
  end

  def new
    @therapist = @patient.therapists.new
  end

  def create
    if therapist_params.values.include?("")
      redirect_to new_patient_therapist_path(@patient)
    else
      @patient.therapists.create!(therapist_params)
      redirect_to patient_therapists_path(@patient)
    end
  end

  def edit
    @therapist = Therapist.find(params[:id])
  end

  def update
    @therapist = Therapist.find(params[:id])
    if @therapist.update(therapist_params)
      @therapist.update(therapist_params)
      redirect_to patient_therapists_path(@patient)
    else
      render :edit
    end
  end

  def destroy
    @patient.therapist_patients.find_by(therapist_id: params[:id]).delete
    redirect_to patient_therapists_path(@patient)
  end

  private

    def therapist_params
      params.require(:therapist).permit(:first_name,
                                        :last_name,
                                        :years_experience,
                                        :therapy_type,
                                        :patient)
    end

end
