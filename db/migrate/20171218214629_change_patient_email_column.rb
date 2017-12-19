class ChangePatientEmailColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :patients, :email, :username
  end
end
