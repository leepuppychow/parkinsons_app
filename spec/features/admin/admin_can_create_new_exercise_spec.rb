require 'rails_helper'

describe "When Admin visits admin exercises index page" do
  context "can click on a link to Add New Exercise" do
    it "can fill out a form with info for a new exercise" do
      admin = create(:patient, username: "admin", password: "password", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_exercises_path

      click_on "Add New Exercise"

      expect(current_path).to eq new_admin_exercise_path

      fill_in "exercise[name]", with: "Tandem Balance"
      fill_in "exercise[description]", with: "stand"
      fill_in "exercise[image]", with: "www.example.com"

      click_on "Submit"

      expect(current_path).to eq admin_exercises_path
      expect(page).to have_content "Tandem Balance"
      expect(page).to have_content "stand"
    end
  end
end
