class RemovePatientExercisesJoinTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :patient_exercises 
  end
end
