class AddDoctorsToPatients < ActiveRecord::Migration[5.1]
  def change
    add_reference :patients, :doctor, foreign_key: true
  end
end
