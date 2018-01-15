require 'rails_helper'

describe "As a logged-in patient, when I visit the appointment index" do
  it "can click on link to add new appointment" do
    patient = create(:patient, username: "test", password: "password", role: 2)
    doctor = create(:doctor, name: "Billy Bob")
    doctor.note = Note.create(contents: "", noteable_id: doctor.id, noteable_type: doctor.class.name)
    therapist = create(:therapist, name: "Jimbo")
    therapist.note = Note.create(contents: "", noteable_id: therapist.id, noteable_type: therapist.class.name)
    patient.doctors << doctor
    patient.therapists << therapist
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)

    visit patient_appointments_path(patient)

    click_on "New Appointment"

    expect(current_path).to eq new_patient_appointment_path(patient)

    fill_in "appointment[date_time]", with: DateTime.now
    select "#{doctor.name}", :from => "appointment[appointable]"
    click_on "Create Appointment"

    expect(current_path).to eq patient_appointments_path(patient)

    visit patient_therapists_path(patient)
    expect(page).to have_content "Billy Bob"
  end
end
