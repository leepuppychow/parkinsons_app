class Admin::ExercisesController < Admin::BaseController

  def index
    @exercises = Exercise.all 
  end

end
