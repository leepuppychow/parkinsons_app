require 'rails_helper'

describe "As a logged-in patient when I visit My Appointments" do
  it "can see all appointments and each one's associated doctor" do
    user = create(:user)
    patient = create(:patient)
    user.patient = patient
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)
    allow_any_instance_of(ApplicationController).to receive(:user_from_sessions).and_return(user)

    doctor = create(:doctor)
    doctor.note = Note.create(contents: "", noteable_id: doctor.id, noteable_type: doctor.class.name)
    appointment1 = create(:appointment, doctor: doctor, patient: patient)
    patient.appointments << appointment1

    visit patient_appointments_path(patient)

    expect(page).to have_css(".simple-calendar")
    expect(page).to have_content appointment1.time.strftime("%I:%M %p")
  end
end
