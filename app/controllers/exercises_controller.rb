class ExercisesController < ApplicationController

  def index
    # Use this in development environment:
    # @patient = current_user
    @patient = Patient.find(params[:patient_id])
    @workout = Exercise.pick_3_random

    # @my_exercises = @patient.patient_exercises
  end

  def new
    @patient = Patient.find(params[:patient_id])
    @exercise = Exercise.new
  end

  def create
    @patient = Patient.find(params[:patient_id])
    # exercise = Exercise.find_or_create_by(name: params[:exercise][:name])
    patient_exercise = @patient.patient_exercises.new(exercise_additional_params)
    byebug
    # patient_exercise.exercise = exercise
    if patient_exercise.save
      flash[:success] = "Exercise added successfully"
      redirect_to patient_exercises_path(@patient)
    else
      render :new
    end
  end


  private

    def exercise_params
      params.require(:exercise).permit(:name)
    end

    def exercise_additional_params
      params[:exercise].require(:exercise).permit(:duration, :date_performed)
    end

end
