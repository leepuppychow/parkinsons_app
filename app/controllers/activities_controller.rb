class ActivitiesController < ApplicationController

  def index
    params[:activity_sort] ||= "date_performed"
    @activities = current_user.activities
    @activity_graph = current_user.activities_with_duration_summed_per_day
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = current_user.activities.new(activity_params)
    if @activity.save
      redirect_to patient_activities_path(current_user)
    else
      flash[:notice] = "Please enter all information."
      render :new
    end
  end

  def edit
    @activity = current_user.activities.find_by(id: params[:id])
  end

  def update
    @activity = current_user.activities.find_by(id: params[:id])
    if @activity.update(activity_params)
      redirect_to patient_activities_path(current_user)
    else
      flash[:notice] = "Please enter all information."
      render :edit
    end
  end

  def destroy
    activity = current_user.activities.find_by(id: params[:id])
    activity.destroy
    redirect_to patient_activities_path(current_user)
  end

  private

    def activity_params
      params.require(:activity).permit(:description, :duration, :date_performed, :activity_sort)
    end

end
