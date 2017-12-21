class Visitor::ExercisesController < ApplicationController

  def index
    @workout = Exercise.pick_3_random
  end

end
