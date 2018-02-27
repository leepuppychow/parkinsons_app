require 'rails_helper'

describe "As a Patient when I visit my doctors page" do
  context "I can see a button to Send Message for each doctor" do
    it "can fill out message form and send to doctor" do
      user = create(:user)
      user2 = create(:user)
      patient = create(:patient)
      user.patient = patient
      doctor = create(:doctor)
      user2.doctor = doctor
      doctor.note = Note.create(contents: "", noteable_id: doctor.id, noteable_type: doctor.class.name)
      patient.doctors << doctor
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)


      visit patient_doctors_path(patient)

      click_on "Send Message"

      expect(current_path).to eq new_patient_message_path(patient)
      fill_in "message[title]", with: "Question about medication"
      fill_in "message[content]", with: "Hey, I think I'm having some side effects"
      click_on "Send!"

      expect(Doctor.first.messages.first.title).to eq "Question about medication"
      expect(Doctor.first.messages.first.content).to eq "Hey, I think I'm having some side effects"
    end
  end
end
