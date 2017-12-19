class ExercisesController < ApplicationController

  def index
    # Use this is development environment:
    # @patient = current_user
    @patient = Patient.find(params[:patient_id])
    @exercises = Exercise.pick_3_random
  end

end
