require 'rails_helper'

describe "When a patient(logged in user) visits their homepage" do
  context "he/she can click on Today's Workout" do
    it "and is able to see an exercise index page" do
      patient = create(:patient)
      create_list(:exercise, 10)

      visit patient_path(patient)

      click_on "My Exercises"

      expect(current_path).to eq patient_exercises_path(patient)

      expect(page).to have_content "Today's Workout"
    end

    it "can click on Log Activity link and be sent to a form to add a new activity" do
      patient = create(:patient)
      create_list(:exercise, 10)

      visit patient_exercises_path(patient)

      click_on "Log Activity"

      expect(current_path).to eq new_patient_activity_path(patient)
      expect(page).to have_content "Log Activity Levels"
      expect(page).to have_content "Total(min)"
      expect(page).to have_content "Date"

      # fill_in "exercise[name]", with: exercise1.name
      fill_in "activity[duration]", with: "20"
      fill_in "activity[date_performed]", with: Date.today
      fill_in "activity[description]", with: "Did today's workout"

      click_on "Log Activity"

      expect(current_path).to eq patient_exercises_path(patient)
    end
  end
end
