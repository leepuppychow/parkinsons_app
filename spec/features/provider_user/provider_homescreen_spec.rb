require 'rails_helper'

describe "As a Doctor(Provider) after logging in" do
  it "will see a homescreen view with a table of today's appointments" do
    user = create(:user)
    doctor = create(:doctor)
    patient1,patient2,patient3 = create_list(:patient, 3)
    doctor.patients << [patient1,patient2,patient3]
    appt1 = create(:appointment, patient: patient1, doctor: doctor)
    appt2 = create(:appointment, patient: patient2, doctor: doctor)
    appt3 = create(:appointment, patient: patient3, doctor: doctor)
    user.doctor = doctor
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(doctor)

    visit doctor_path(doctor)

    expect(page).to have_content "Welcome, #{doctor.name}"
    expect(page).to have_css(".appointment", count: 3)
    expect(page).to have_content appt1.pretty_time
    expect(page).to have_content appt2.pretty_time
    expect(page).to have_content appt3.pretty_time
    expect(page).to have_content patient1.first_name
    expect(page).to have_content patient2.first_name
    expect(page).to have_content patient3.first_name
  end
end
