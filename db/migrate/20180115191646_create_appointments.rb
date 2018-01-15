class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.datetime :date_time
      t.string :status
      t.references :patient, foreign_key: true
      t.references :appointable, polymorphic: true
    end
  end
end
