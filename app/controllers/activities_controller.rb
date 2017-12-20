class ActivitiesController < ApplicationController

  def index
    @patient = Patient.find(params[:patient_id])
  end

  def new
    @patient = Patient.find(params[:patient_id])
    @activity = Activity.new
  end

  def create
    @patient = Patient.find(params[:patient_id])
    activity = @patient.activities.new(activity_params)
    if activity.save
      flash[:success] = "Logged new activity: #{activity.description}"
      redirect_to patient_activities_path(@patient)
    else
      render :new
    end
  end

  private

    def activity_params
      params.require(:activity).permit(:description, :duration, :date_performed)
    end

end
