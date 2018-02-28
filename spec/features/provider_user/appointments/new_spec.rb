require 'rails_helper'

describe "As a Provider, when I visit the appointment index" do
  it "can click on link to CREATE a new appointment" do
    user = create(:user)
    doctor = create(:doctor)
    patient1 = create(:patient)
    doctor.patients << patient1
    user.doctor = doctor
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(doctor)
    allow_any_instance_of(ApplicationController).to receive(:user_from_sessions).and_return(user)

    visit doctor_appointments_path(doctor)
    click_on "Schedule New Appointment"

    fill_in "appointment[date]", with: Date.today
    fill_in "appointment[time]", with: "01:30 PM"
    select "#{patient1.full_name}", :from => "appointment[patient_id]"
    click_on "Create Appointment"

    expect(current_path).to eq doctor_appointments_path(doctor)
    expect(page).to have_css ".simple-calendar"
    expect(page).to have_content "01:30 PM"
  end
end
