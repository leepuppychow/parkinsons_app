require 'rails_helper'

describe "As a logged-in patient, when I visit the appointment index" do
  it "can click on link to add new appointment" do
    user = create(:user)
    patient = create(:patient)
    user.patient = patient
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)

    doctor = create(:doctor, name: "Billy Bob")
    doctor.note = Note.create(contents: "", noteable_id: doctor.id, noteable_type: doctor.class.name)
    patient.doctors << doctor

    visit patient_appointments_path(patient)

    fill_in "appointment[date_time]", with: DateTime.now
    select "#{doctor.name}", :from => "appointment[doctor_id]"
    click_on "Create Appointment"

    expect(current_path).to eq patient_appointments_path(patient)

    visit patient_doctors_path(patient)
    expect(page).to have_content "Billy Bob"
  end
end
