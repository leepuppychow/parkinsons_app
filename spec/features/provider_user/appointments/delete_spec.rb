require 'rails_helper'

describe "As a Provider, when I visit the appointment index" do
  it "can click on link to DELETE an existing appointment" do
    user = create(:user)
    doctor = create(:doctor)
    patient1,patient2,patient3 = create_list(:patient, 3)
    doctor.patients << [patient1,patient2,patient3]
    appt1 = create(:appointment, patient: patient1, doctor: doctor)
    user.doctor = doctor
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(doctor)

    visit doctor_appointments_path(doctor)
    click_on "#{appt1.time.strftime("%I:%M %p")}"
    expect(current_path).to eq edit_doctor_appointment_path(doctor, appt1)

    click_on "Delete Appointment"

    expect(current_path).to eq doctor_appointments_path(doctor)
    expect(Appointment.count).to eq 0
  end
end
