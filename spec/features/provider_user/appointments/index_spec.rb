require 'rails_helper'

describe "As a doctor/provider user" do
  it "can click a link to see a calendar view of appointments" do
    user = create(:user)
    doctor = create(:doctor)
    patient1,patient2,patient3 = create_list(:patient, 3)
    doctor.patients << [patient1,patient2,patient3]
    appt1 = create(:appointment, patient: patient1, doctor: doctor)
    appt2 = create(:appointment, patient: patient2, doctor: doctor)
    appt3 = create(:appointment, patient: patient3, doctor: doctor)
    user.doctor = doctor
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(doctor)

    visit doctor_appointments_path(doctor)

    expect(page).to have_css(".simple-calendar")
    expect(page).to have_content appt1.pretty_time
    expect(page).to have_content appt2.pretty_time
    expect(page).to have_content appt3.pretty_time
  end
end
