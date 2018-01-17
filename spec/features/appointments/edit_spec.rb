require 'rails_helper'

describe "As a logged-in patient, when I visit the appointment index" do
  it "can click on link to edit an existing appointment" do
    patient = create(:patient, username: "test", password: "password", role: 2)
    doctor = create(:doctor, name: "Billy Bob")
    doctor.note = Note.create(contents: "", noteable_id: doctor.id, noteable_type: doctor.class.name)
    patient.doctors << doctor
    appt = create(:appointment, appointable_id: doctor.id, appointable_type: doctor.class.name, patient: patient)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)

    visit patient_appointments_path(patient)

    click_on "Edit Appointment"

    expect(current_path).to eq edit_patient_appointment_path(patient, appt)

    fill_in "appointment[date_time]", with: DateTime.now + 7
    select "#{doctor.name}", :from => "appointment[appointable]"
    click_on "Update Appointment"

    expect(current_path).to eq patient_appointments_path(patient)

    visit patient_therapists_path(patient)
    expect(page).to have_content doctor.name
    expect(page).to have_content (DateTime.now + 7).strftime("%b %e, %Y")
  end
end
