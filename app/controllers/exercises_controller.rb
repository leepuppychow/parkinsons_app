class ExercisesController < ApplicationController

  def index
    # Use this is development environment:
    # @patient = current_user
    @patient = Patient.find(params[:patient_id])
    @exercises = Exercise.pick_3_random
    @my_exercises = @patient.patient_exercises
  end

  def update
    @patient = Patient.find(params[:patient_id])
    @exercise = Exercise.find(params[:id])
    byebug
  end


end
