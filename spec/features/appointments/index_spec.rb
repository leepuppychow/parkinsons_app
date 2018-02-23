require 'rails_helper'

describe "As a logged-in patient when I visit My Appointments" do
  it "can see all appointments and each one's associated doctor" do
    patient = create(:patient, username: "test", password: "password", role: 2)
    doctor = create(:doctor)
    doctor.note = Note.create(contents: "", noteable_id: doctor.id, noteable_type: doctor.class.name)
    appointment1 = Appointment.create(date_time: DateTime.now, status: "attended",
      appointable_id: doctor.id, appointable_type: doctor.class.name)
    patient.appointments << appointment1

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)

    visit patient_appointments_path(patient)

    expect(page).to have_content appointment1.date_time.strftime("%b %e, %Y --> %I:%M %p")
    expect(page).to have_content appointment2.date_time.strftime("%b %e, %Y --> %I:%M %p")
    expect(page).to have_content doctor.name
  end
end

describe "As a logged-in patient when I visit My Care Team" do
  it "I can see any appointments linked with that care provider" do
    patient = create(:patient, username: "test", password: "password", role: 2)
    doctor = create(:doctor)
    doctor.note = Note.create(contents: "", noteable_id: doctor.id, noteable_type: doctor.class.name)
    appointment1 = Appointment.create(date_time: DateTime.now, status: "attended",
      appointable_id: doctor.id, appointable_type: doctor.class.name)

    patient.doctors << doctor
    patient.appointments << appointment1

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)

    visit patient_doctors_path(patient)

    expect(page).to have_content appointment1.date_time.strftime("%b %e, %Y --> %I:%M %p")
    expect(page).to have_content appointment2.date_time.strftime("%b %e, %Y --> %I:%M %p")
    expect(page).to have_content doctor.name
  end
end
