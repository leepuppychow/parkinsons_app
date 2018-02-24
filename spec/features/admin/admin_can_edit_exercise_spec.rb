require 'rails_helper'

describe "When Admin visits admin exercises index page" do
  context "can click on a link to Edit Exercise" do
    it "can fill out a form with info for exercise" do
      admin = create(:user, username: "admin", password: "password")
      exercise = create(:exercise)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_exercises_path

      click_on "Edit"

      expect(current_path).to eq edit_admin_exercise_path(exercise)

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
