require 'rails_helper'

describe "When a patient visits their homepage" do
  context "He/she can click on Activity Tracker" do
    it "sees an Activity Index page" do
      patient = create(:patient, username: "test", password: "password", role: 2)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)

      visit patient_path(patient)

      click_on "Activity Tracker"

      expect(current_path).to eq patient_activities_path(patient)
      expect(page).to have_content "Activity Tracker"
      expect(page).to have_content "Your Activity Levels"
      expect(page).to have_content "Log New Activity"
    end
  end
end
