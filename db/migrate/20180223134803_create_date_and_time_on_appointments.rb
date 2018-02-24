class CreateDateAndTimeOnAppointments < ActiveRecord::Migration[5.1]
  def change
    remove_column :appointments, :date_time
    add_column :appointments, :date, :date
    add_column :appointments, :time, :time  
  end
end
