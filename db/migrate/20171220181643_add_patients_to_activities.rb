class AddPatientsToActivities < ActiveRecord::Migration[5.1]
  def change
    add_reference :activities, :patient, foreign_key: true
  end
end
