require 'rails_helper'

describe "When Admin visits admin exercises index page" do
  context "can click on a link to Remove Exercise" do
    it "can delete an exercise from the database" do
      admin = create(:patient, username: "admin", password: "password", role: 1)
      exercise = create(:exercise)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_exercises_path

      expect(page).to have_content exercise.name

      click_on "Remove"

      expect(current_path).to eq admin_exercises_path
      expect(page).to_not have_content exercise.name 
    end
  end
end
