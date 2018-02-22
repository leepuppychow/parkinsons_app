class AddUserToPatients < ActiveRecord::Migration[5.1]
  def change
    add_reference :patients, :user, foreign_key: true
  end
end
