class ActivitiesController < ApplicationController
  before_action :current_user

  def index
    @activities = @patient.activities.order("date_performed DESC")
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = @patient.activities.new(activity_params)
    if @activity.save
      flash[:notice] = "Logged new activity: #{@activity.description}"
      redirect_to patient_activities_path(@patient)
    else
      render :new
    end
  end

  def edit
    @activity = @patient.activities.find_by(id: params[:id])
  end

  def update
    @activity = @patient.activities.find_by(id: params[:id])
    @activity.update(activity_params)
    if @activity.save
      redirect_to patient_activities_path(@patient)
    else
      render :edit
    end
  end

  def destroy
    activity = @patient.activities.find_by(id: params[:id])
    activity.destroy
    redirect_to patient_activities_path(@patient)
  end

  private

    def activity_params
      params.require(:activity).permit(:description, :duration, :date_performed)
    end

end
