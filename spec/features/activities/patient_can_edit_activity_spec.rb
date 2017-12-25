require 'rails_helper'

describe "When a patient visits activity index" do
  it "can click on Edit link and be sent to a form to edit an activity" do
    patient = create(:patient, username: "admin", password: "password", role: 2)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)
    activity = create(:activity, patient: patient)

    visit patient_activities_path(patient)

    click_on "Edit"

    expect(current_path).to eq edit_patient_activity_path(patient, activity)
    expect(page).to have_content "Edit #{activity.description}"
    expect(page).to have_content "Total(min)"
    expect(page).to have_content "Date"

    fill_in "activity[description]", with: "Did today workout"
    fill_in "activity[duration]", with: 20
    fill_in "activity[date_performed]", with: Date.today

    click_on "Update Activity"

    expect(current_path).to eq patient_activities_path(patient)
    expect(page).to have_content 20
    expect(page).to have_content "Did today's workout"
  end
end
