class ActivitiesController < ApplicationController

  def index
    @patient = Patient.find(params[:patient_id])
  end

  def new
    @patient = Patient.find(params[:patient_id])
    @activity = Activity.new
  end

  def create
    byebug
  end

end
