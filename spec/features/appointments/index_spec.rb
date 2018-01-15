require 'rails_helper'

describe "As a logged-in patient when I visit My Appointments" do
  it "can see all appointments and each one's associated doctor or therapist" do
    patient = create(:patient, username: "test", password: "password", role: 2)
    doctor = create(:doctor)
    doctor.note = Note.create(contents: "", noteable_id: doctor.id, noteable_type: doctor.class.name)
    appointment1 = Appointment.create(date_time: DateTime.now, status: "attended",
      appointable_id: doctor.id, appointable_type: doctor.class.name)
    therapist = create(:therapist)
    therapist.note = Note.create(contents: "", noteable_id: therapist.id, noteable_type: therapist.class.name)
    appointment2 = Appointment.create(date_time: DateTime.now, status: "late",
      appointable_id: therapist.id, appointable_type: therapist.class.name)
    patient.appointments << [appointment1, appointment2]

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)

    visit patient_appointments_path(patient)

    expect(page).to have_content appointment1.date_time.strftime("%b %e, %Y --> %I:%M %p")
    expect(page).to have_content appointment2.date_time.strftime("%b %e, %Y --> %I:%M %p")
    expect(page).to have_content doctor.name
    expect(page).to have_content therapist.name
  end
end

describe "As a logged-in patient when I visit My Care Team" do
  it "I can see any appointments linked with that care provider" do
    patient = create(:patient, username: "test", password: "password", role: 2)
    doctor = create(:doctor)
    doctor.note = Note.create(contents: "", noteable_id: doctor.id, noteable_type: doctor.class.name)
    appointment1 = Appointment.create(date_time: DateTime.now, status: "attended",
      appointable_id: doctor.id, appointable_type: doctor.class.name)
    therapist = create(:therapist)
    therapist.note = Note.create(contents: "", noteable_id: therapist.id, noteable_type: therapist.class.name)
    appointment2 = Appointment.create(date_time: DateTime.now, status: "late",
      appointable_id: therapist.id, appointable_type: therapist.class.name)

    patient.doctors << doctor
    patient.therapists << therapist
    patient.appointments << [appointment1, appointment2]

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)

    visit patient_therapists_path(patient)

    expect(page).to have_content appointment1.date_time.strftime("%b %e, %Y --> %I:%M %p")
    expect(page).to have_content appointment2.date_time.strftime("%b %e, %Y --> %I:%M %p")
    expect(page).to have_content doctor.name
    expect(page).to have_content therapist.name
  end
end
