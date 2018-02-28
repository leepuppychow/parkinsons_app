require 'rails_helper'

describe "As a Provider, when I visit the appointment index" do
  it "can click on link to UPDATE an existing appointment" do
    user = create(:user)
    doctor = create(:doctor)
    patient1 = create(:patient)
    doctor.patients << patient1
    user.doctor = doctor
    appt = create(:appointment, doctor: doctor, patient: patient1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(doctor)
    allow_any_instance_of(ApplicationController).to receive(:user_from_sessions).and_return(user)

    visit doctor_appointments_path(doctor)
    click_on "#{appt.time.strftime("%I:%M %p")}"

    fill_in "appointment[date]", with: Date.today
    fill_in "appointment[time]", with: "01:30 PM"
    select "#{patient1.full_name}", :from => "appointment[patient_id]"
    click_on "Update Appointment"

    expect(current_path).to eq doctor_appointments_path(doctor)
    expect(page).to have_css ".simple-calendar"
  end
end
