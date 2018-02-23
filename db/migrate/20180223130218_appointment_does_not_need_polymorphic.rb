class AppointmentDoesNotNeedPolymorphic < ActiveRecord::Migration[5.1]
  def change
    remove_column :appointments, :appointable_type
    remove_column :appointments, :appointable_id
    add_reference :appointments, :doctor, foreign_key: true
  end
end
