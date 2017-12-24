class ActivitiesController < ApplicationController

  def index
    @patient = Patient.find(params[:patient_id])
    @activities = @patient.activities.order("date_performed DESC")
  end

  def new
    @patient = Patient.find(params[:patient_id])
    @activity = Activity.new
  end

  def create
    @patient = Patient.find(params[:patient_id])
    @activity = @patient.activities.new(activity_params)
    if @activity.save
      flash[:notice] = "Logged new activity: #{@activity.description}"
      redirect_to patient_activities_path(@patient)
    else
      render :new
    end
  end

  def edit
    @patient = Patient.find(params[:patient_id])
    @activity = @patient.activities.find_by(id: params[:id])
  end

  def update
    @patient = Patient.find(params[:patient_id])
    @activity = @patient.activities.find_by(id: params[:id])
    @activity.update(activity_params)
    if @activity.save
      redirect_to patient_activities_path(@patient)
    else
      render :edit
    end
  end

  def destroy
    patient = Patient.find(params[:patient_id])
    activity = patient.activities.find_by(id: params[:id])
    activity.destroy
    redirect_to patient_activities_path(patient)
  end

  private

    def activity_params
      params.require(:activity).permit(:description, :duration, :date_performed)
    end

end
