require 'rails_helper'

describe "As a logged-in patient, when I visit the appointment index" do
  it "can click on link to DELETE an existing appointment" do
    patient = create(:patient, username: "test", password: "password", role: 2)
    doctor = create(:doctor, name: "Billy Bob")
    doctor.note = Note.create(contents: "", noteable_id: doctor.id, noteable_type: doctor.class.name)
    patient.doctors << doctor
    appt = create(:appointment, appointable_id: doctor.id, appointable_type: doctor.class.name, patient: patient)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)

    visit patient_appointments_path(patient)

    click_on "Delete"

    expect(current_path).to eq patient_appointments_path(patient)
    expect(page).to_not have_content appt.date_time
  end
end
