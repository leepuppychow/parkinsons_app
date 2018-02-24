require 'rails_helper'

describe "As a logged-in patient, when I visit the appointment index" do
  it "can click on link to edit an existing appointment" do
    user = create(:user)
    patient = create(:patient)
    user.patient = patient
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)

    doctor = create(:doctor, name: "Billy Bob")
    doctor.note = Note.create(contents: "", noteable_id: doctor.id, noteable_type: doctor.class.name)
    patient.doctors << doctor
    appt = create(:appointment, doctor: doctor, patient: patient)

    visit patient_appointments_path(patient)

    click_on "#{appt.time.strftime("%I:%M %p")}"

    expect(current_path).to eq edit_patient_appointment_path(patient, appt)

    fill_in "appointment[date]", with: Date.today + 7
    fill_in "appointment[time]", with: Time.now
    select "#{doctor.name}", :from => "appointment[doctor_id]"
    click_on "Update Appointment"

    expect(current_path).to eq patient_appointments_path(patient)
    expect(page).to have_css ".simple-calendar"
    expect(page).to have_content appt.time.strftime("%I:%M %p")
  end
end
