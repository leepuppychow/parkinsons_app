require 'rails_helper'

describe "When a patient(logged in user) visits their homepage" do
  context "he/she can click on Today's Workout" do
    it "and is able to see an exercise index page" do
      patient = create(:patient)
      create_list(:exercise, 10)

      visit patient_path(patient)

      click_on "Today's Workout"

      expect(current_path).to eq patient_exercises_path(patient)

      expect(page).to have_content "Today's Workout"
    end
  end
end
