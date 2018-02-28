require 'rails_helper'

describe "As a logged-in patient, when I visit the appointment index" do
  it "can click on link to DELETE an existing appointment" do
    user = create(:user)
    patient = create(:patient)
    user.patient = patient
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)
    allow_any_instance_of(ApplicationController).to receive(:user_from_sessions).and_return(user)

    doctor = create(:doctor, name: "Billy Bob")
    doctor.note = Note.create(contents: "", noteable_id: doctor.id, noteable_type: doctor.class.name)
    patient.doctors << doctor
    appt = create(:appointment, doctor: doctor, patient: patient)

    visit patient_appointments_path(patient)

    click_on "Remove"

    expect(current_path).to eq patient_appointments_path(patient)
    expect(Appointment.count).to eq 0
  end
end
