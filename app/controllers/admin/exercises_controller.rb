class Admin::ExercisesController < Admin::BaseController

  def index
    @exercises = Exercise.all
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      redirect_to admin_exercises_path
    else
      render :new
    end
  end

  def edit
    @exercise = Exercise.find(params[:id])
  end

  def update
    @exercise = Exercise.find(params[:id])
    if @exercise.update(exercise_params)
      redirect_to admin_exercises_path
    else
      render :edit
    end
  end

  def destroy
    exercise = Exercise.find(params[:id])
    exercise.destroy
    redirect_to admin_exercises_path
  end 

  private

    def exercise_params
      params.require(:exercise).permit(:name, :description, :image)
    end

end
