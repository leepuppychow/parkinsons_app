require 'rails_helper'

describe "When a patient(logged in user) visits their homepage" do
  context "he/she can click on Today's Workout" do
    it "and is able to see an exercise index page" do
      user = create(:user)
      patient = create(:patient)
      user.patient = patient
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)
      create_list(:exercise, 10)

      visit patient_exercises_path(patient)

      expect(page).to have_css(".exercise", count: 3)
      expect(page).to have_content "Log New Activity"
    end
  end
end
