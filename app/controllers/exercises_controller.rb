class ExercisesController < ApplicationController
  # before_action :current_user

  def index
    @workout = Exercise.pick_3_random
  end

end
