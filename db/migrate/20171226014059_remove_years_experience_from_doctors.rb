class RemoveYearsExperienceFromDoctors < ActiveRecord::Migration[5.1]
  def change
    remove_column :doctors, :years_experience
    remove_column :therapists, :years_experience
  end
end
