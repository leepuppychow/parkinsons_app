require 'rails_helper'

describe "As a Provider user" do
  context "I can click on a Patients link" do
    it "And see all my current patients" do
      user = create(:user)
      doctor = create(:doctor)
      user.doctor = doctor
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(doctor)
      allow_any_instance_of(ApplicationController).to receive(:user_from_sessions).and_return(user)
      patient1, patient2, patient3 = create_list(:patient, 3)
      doctor.patients << [patient1, patient2, patient3]

      visit doctor_patients_path(doctor)

      expect(page).to have_content "My Patients"
      expect(page).to have_css(".providers-patient", count: 3)
      expect(page).to have_link "Send Message"
    end
  end
end
