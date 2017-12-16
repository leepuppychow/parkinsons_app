class CreatePatientMedications < ActiveRecord::Migration[5.1]
  def change
    create_table :patient_medications do |t|
      t.integer :freq_per_day
      t.string :dosage
      t.references :patient, foreign_key: true
      t.references :medication, foreign_key: true

      t.timestamps 
    end
  end
end
