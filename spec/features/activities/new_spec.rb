require 'rails_helper'

describe "When a patient visits activity index" do
  it "can click on Log Activity link and be sent to a form to add a new activity" do
    patient = create(:patient, username: "test", password: "password", role: 2)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)

    visit patient_activities_path(patient)

    click_on "Log New Activity"

    expect(current_path).to eq new_patient_activity_path(patient)
    expect(page).to have_content "Log Activity Levels"
    expect(page).to have_content "Total(min)"
    expect(page).to have_content "Date"
    fill_in "activity[description]", with: "Did today's workout"
    fill_in "activity[duration]", with: 20
    fill_in "activity[date_performed]", with: "12/25/2017"

    click_on "Create Activity"

    expect(current_path).to eq patient_activities_path(patient)
    expect(page).to have_content 20
    expect(page).to have_content "Did today's workout"
  end
end
