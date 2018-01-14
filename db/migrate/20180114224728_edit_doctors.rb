class EditDoctors < ActiveRecord::Migration[5.1]
  def change
    remove_column :doctors, :years_experience

  end
end
