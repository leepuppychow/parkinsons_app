class DeleteTherapistsTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :therapist_patients
    drop_table :therapists
  end
end
