require 'rails_helper'

describe "As a Doctor/Provider user" do
  context "can access a Prediction Tool page" do
    it "that can predict patient's fall risk based on age, berg balance, and gait speed" do
      user = create(:user)
      doctor = create(:doctor)
      user.doctor = doctor
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(doctor)

      visit doctor_tools_path(doctor)

      fill_in "age", with: 75
      fill_in "berg", with: 35    # do raw Berg score (out of 56 total)
      fill_in "gait", with: 0.6   # meters/second
      click_on "Predict Fall Risk"

      expect(current_path).to eq doctor_tools_path(doctor)
      expect(page).to have_content "High Fall Risk"
      expect(page).to have_content "Model Accuracy: 80%"
    end
  end
end
