class CreateTherapistPatients < ActiveRecord::Migration[5.1]
  def change
    create_table :therapist_patients do |t|
      t.references :therapist, foreign_key: true
      t.references :patient, foreign_key: true

      t.timestamps 
    end
  end
end
