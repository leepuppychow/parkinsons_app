require 'rails_helper'

describe "As a Provider when I visit my patients page" do
  context "I can see a button to Send Message for each patient" do
    it "can fill out message form and send to patient" do
      user = create(:user)
      user2 = create(:user)
      patient = create(:patient)
      user.patient = patient
      doctor = create(:doctor)
      user2.doctor = doctor
      doctor.note = Note.create(contents: "", noteable_id: doctor.id, noteable_type: doctor.class.name)
      patient.doctors << doctor
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(doctor)
      allow_any_instance_of(ApplicationController).to receive(:user_from_sessions).and_return(user2)

      visit doctor_patients_path(doctor)

      click_on "Send Message"

      expect(current_path).to eq new_doctor_message_path(doctor)
      fill_in "message[title]", with: "Re: about that medication"
      fill_in "message[content]", with: "What side effects are you having??"
      click_on "Send!"

      expect(Patient.first.messages.first.title).to eq "Re: about that medication"
      expect(Patient.first.messages.first.content).to eq "What side effects are you having??"
    end
  end
end
