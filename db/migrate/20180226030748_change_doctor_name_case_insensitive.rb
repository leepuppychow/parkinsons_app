class ChangeDoctorNameCaseInsensitive < ActiveRecord::Migration[5.1]
  def change
    enable_extension :citext
    change_column :doctors, :name, :citext
    change_column :doctors, :specialty, :citext
    change_column :doctors, :location, :citext
  end
end
