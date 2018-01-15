require 'rails_helper'

describe "As a logged-in patient when I visit My Care Team index" do
  it "can see any appointment associated with a doctor or therapist" do
    patient = create(:patient, username: "test", password: "password", role: 2)
    doctor = create(:doctor)
    doctor.note = create(:note)
    appointment = create(:appointment)
    patient.appointments << appointment
    doctor.appointments << appointment

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)

    visit patient_therapists_path(patient)

    expect(page).to have_content appointment.date_time 

  end
end
