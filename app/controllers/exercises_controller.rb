class ExercisesController < ApplicationController

  def index
    @exercises = Exercise.pick_3_random
  end

end
