class ChangeColumnsPatient < ActiveRecord::Migration[5.1]
  def change
    remove_column :patients, :username
    remove_column :patients, :password_digest
    remove_column :patients, :role
  end
end
