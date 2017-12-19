class CreatePatientExercises < ActiveRecord::Migration[5.1]
  def change
    create_table :patient_exercises do |t|
      t.integer :duration
      t.date :date_performed
      t.references :patient, foreign_key: true
      t.references :exercise, foreign_key: true

      t.timestamps
    end
  end
end
